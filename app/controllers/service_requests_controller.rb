class ServiceRequestsController < ApplicationController
  def show
    @request = ServiceRequest.find params[:id]
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

  private

  def req_params
    params.require(:service_requests_initiate).permit(:message, :subject)
  end
end
