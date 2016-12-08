class Message < ApplicationRecord
  belongs_to :sender_id
  has_secure_token
end
