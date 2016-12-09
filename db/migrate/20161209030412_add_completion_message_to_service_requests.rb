class AddCompletionMessageToServiceRequests < ActiveRecord::Migration[5.0]
  def change
    add_column :service_requests, :completion_message, :text
  end
end
