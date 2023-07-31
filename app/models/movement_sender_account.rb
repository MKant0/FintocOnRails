class MovementSenderAccount < ApplicationRecord
  belongs_to :movement
  has_one :movement_sender_institutions
end
