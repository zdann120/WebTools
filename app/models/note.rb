class Note < ApplicationRecord
  belongs_to :user
  belongs_to :noteable, polymorphic: true
  has_secure_token
end
