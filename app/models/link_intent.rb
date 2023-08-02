class LinkIntent < ApplicationRecord
  belongs_to :user, foreign_key: 'id_user'
  has_one :exchange_token, dependent: :destroy
end
