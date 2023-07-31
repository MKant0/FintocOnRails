class MovementRecipientAccount < ApplicationRecord
  belongs_to :movement
  has_one :movement_recipient_institutions
end
