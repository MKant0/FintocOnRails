require 'net/http'

class LinksController < ApplicationController
  def create
    exchange_token = params[:exchange_token] # Obtén el exchange token de alguna manera (por ejemplo, a través de params)

    uri = URI("https://api.fintoc.com/v1/links")

    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true

    request = Net::HTTP::Post.new(uri)
    request["Authorization"] = ENV['FINTOC_API_KEY']
    request["content-type"] = 'application/json'
    request.body = {
      "link_token" => exchange_token
    }.to_json

    response = http.request(request)
    response_body = JSON.parse(response.body)

    @link = Link.new(
      object: response_body["object"],
      username: response_body["username"],
      holder_id: response_body["holder_id"],
      link_token: response_body["link_token"],
      holder_type: response_body["holder_type"],
      mode: response_body["mode"],
      active: response_body["active"],
      status: response_body["status"],
      id_link_institution: response_body["id_link_institution"],
      id_user: current_user.id
    )

    if @link.save
      # Aquí puedes manejar el caso de éxito
    else
      # Aquí puedes manejar el caso de error
    end
  end
end

