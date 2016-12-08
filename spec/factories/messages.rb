FactoryGirl.define do
  factory :message do
    sender_id nil
    recipient_id 1
    subject "MyString"
    message "MyText"
    token ""
    important false
  end
end
