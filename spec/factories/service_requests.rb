FactoryGirl.define do
  factory :service_request do
    token ""
    aasm_state "MyString"
    user nil
    subject "MyString"
    message "MyText"
    urgent false
  end
end
