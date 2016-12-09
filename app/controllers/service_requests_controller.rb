class ServiceRequestsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_request, only: [:show]

  def show
    authorize @request
  end

  def new
    @request = ServiceRequests::Initiate.new
  end

  def create
    @outcome = ServiceRequests::Initiate.run(
      user: current_user,
      message: req_params['message'],
      subject: req_params['subject']
    )
    if @outcome.valid?
      redirect_to service_requests_path, notice: "Request ID #{@outcome.result.token} has been added."
    else
      render 'new'
    end
  end

  def begin
    @request = ServiceRequest.find params[:service_request_id]
    authorize @request
    @request.begin!
    redirect_to @request, notice: 'State changed to: "in progress"'
  end

  def complete
    @request = ServiceRequest.find params[:service_request_id]
    authorize @request
    @outcome = ServiceRequests::Complete.run(service_request: @request, message: params[:service_request]['completion_message'])
    if @outcome.valid?
      redirect_to @request, notice: 'State changed to: "completed"'
    end
  end

  def cancel
    @request = ServiceRequest.find params[:service_request_id]
    authorize @request
    @request.cancel!
    redirect_to @request, notice: 'State changed to: "canceled"'
  end

  private

  def set_request
    @request = ServiceRequest.find params[:id]
  end

  def req_params
    params.require(:service_requests_initiate).permit(:message, :subject)
  end
end
