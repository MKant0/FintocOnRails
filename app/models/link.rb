class Link < ApplicationRecord
  belongs_to :user, optional: true
  has_one :link_institution
  has_many :link_accounts
end
