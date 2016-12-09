FactoryGirl.define do
  factory :note do
    noteable_id 1
    noteable_type 1
    subject "MyString"
    message "MyText"
    token ""
    user nil
  end
end
