class PaymentIntent < ApplicationRecord
  belongs_to :user
  has_one :payment_sender_accounts
  has_one :payment_recipient_accounts
end
