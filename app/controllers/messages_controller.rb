class MessagesController < ApplicationController
  before_action :authenticate_user!

  def index
    @messages = Message.find_by_recipient_id(current_user.id)
  end
end
