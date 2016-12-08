class MessagesController < ApplicationController
  before_action :authenticate_user!

  def index
    @messages = Message.where(recipient_id: current_user.id)
  end

  def new
    authorize Message.new
  end

  def create
    authorize Message.new
    @message = Messages::Send.run(
      initiator: current_user,
      recipient: User.find(msg_params['recipient']),
      subject: msg_params['subject'],
      message: msg_params['message']
    )
    if @message.valid?
      redirect_to messages_path
    else
      render 'new'
    end
  end

  private

  def msg_params
    params.require(:messages_send).permit(:recipient, :subject, :message)
  end
end
