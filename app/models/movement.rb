class Movement < ApplicationRecord
  belongs_to :user
  has_one :movement_recipient_accounts
  has_one :movement_sender_accounts
end
