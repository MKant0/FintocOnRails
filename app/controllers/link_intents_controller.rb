require 'net/http'

class LinkIntentsController < ApplicationController
  def create
    product = params[:product]
    country = params[:country]
    holder_type = params[:holder_type]

    response_body = create_link_intent(product, country, holder_type)

    @link_intent = LinkIntent.new(
      widget_token: response_body["widget_token"],
      product: product,
      country: country,
      holder_type: holder_type,
      id_user: current_user.id, # Asume que tienes un método current_user que devuelve el usuario actual
      created_at: Time.now
    )

    if @link_intent.save
      # Aquí puedes redirigir al usuario o hacer lo que necesites después de guardar el intento de enlace
    else
      # Aquí puedes manejar el caso en que el intento de enlace no se pueda guardar
    end
  end

  private

  def create_link_intent(product, country, holder_type)
    uri = URI("https://api.fintoc.com/v1/link_intents")

    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true

    request = Net::HTTP::Post.new(uri)
    request["accept"] = 'application/json'
    request["Authorization"] = ENV['FINTOC_API_KEY']
    request["content-type"] = 'application/json'
    request.body = {
      "product" => product,
      "country" => country,
      "holder_type" => holder_type
    }.to_json

    response = http.request(request)
    response_body = JSON.parse(response.body)

    response_body
  end
end
