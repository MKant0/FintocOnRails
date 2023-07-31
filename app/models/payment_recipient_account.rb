class PaymentRecipientAccount < ApplicationRecord
  belongs_to :payment_intents
end
