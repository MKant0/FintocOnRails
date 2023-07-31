class PaymentSenderAccount < ApplicationRecord
  belongs_to :payment_intents
end
