require 'fintoc'
require 'dotenv/load'

class FintocServices
  def initialize
    @fintoc_client = Fintoc::Client.new(ENV['FINTOC_API_KEY'])
  end

  def get_user_data(link_token)
    link = @fintoc_client.get_link(link_token)
    link
  end

  def get_user_banks(link_token)
    link = @fintoc_client.get_link(link_token)
    accounts = link.get_accounts
    accounts
  end

  def get_user_movements(link_token)
    link = @fintoc_client.get_link(link_token)
    movements = link.get_movements
    movements
  end

  def create_payment(link_token, payment_details)
    link = @fintoc_client.get_link(link_token)
    payment = link.create_payment(payment_details)
    payment
  end
end
