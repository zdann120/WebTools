class ServiceRequests::Complete < ActiveInteraction::Base
  object :service_request
  string :message

  def execute
    service_request.update_attributes(
      completion_message: message
    )
    service_request.complete!
  end
end
