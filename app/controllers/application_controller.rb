class ApplicationController < ActionController::Base
  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :not_authorized
  protect_from_forgery with: :exception

  private

  def not_authorized
    redirect_to root_path, notice: 'Sorry, you are not allowed to do that.'
  end
end
