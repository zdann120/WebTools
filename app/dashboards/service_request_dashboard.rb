require "administrate/base_dashboard"

class ServiceRequestDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    user: Field::BelongsTo,
    id: Field::Number,
    token: Field::String,
    aasm_state: Field::String,
    subject: Field::String,
    message: Field::Text,
    urgent: Field::Boolean,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    completion_message: Field::Text,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :user,
    :id,
    :aasm_state,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :user,
    :id,
    :token,
    :aasm_state,
    :subject,
    :message,
    :urgent,
    :created_at,
    :updated_at,
    :completion_message,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :user,
    :token,
    :aasm_state,
    :subject,
    :message,
    :urgent,
    :completion_message,
  ].freeze

  # Overwrite this method to customize how service requests are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(service_request)
  #   "ServiceRequest ##{service_request.id}"
  # end
end
