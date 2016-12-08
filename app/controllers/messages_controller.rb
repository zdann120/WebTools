class MessagesController < ApplicationController
  before_action :authenticate_user!

  def index
    @messages = Message.where(recipient_id: current_user.id)
  end
end
