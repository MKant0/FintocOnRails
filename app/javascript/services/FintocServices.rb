require 'fintoc'
require 'dotenv/load'

class FintocServices

  def create_link_intent
    uri = URI("https://api.fintoc.com/v1/link_intents")

    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true

    request = Net::HTTP::Post.new(uri)
    request["accept"] = 'application/json'
    request["Authorization"] = ENV['FINTOC_API_KEY']
    request["content-type"] = 'application/json'
    request.body = {
      "product" => "movements",
      "country" => "cl",
      "holder_type" => "business"
    }.to_json

    response = http.request(request)
    response_body = JSON.parse(response.body)

    response_body["widget_token"]
  end

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
