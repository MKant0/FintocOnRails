require 'net/http'


class LinksController < ApplicationController
  before_action :authenticate_user!

  def create
    puts "params[:exchange_token]: #{params[:exchange_token]}"
    exchange_token = ExchangeToken.find_by(token: params[:exchange_token])

    if exchange_token.nil?
      # Maneja el caso en que no se encuentra el exchange_token
      puts "Error: No se encontró el exchange_token"
      return
    end

    uri = URI("https://api.fintoc.com/v1/links")

    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true

    request = Net::HTTP::Post.new(uri)
    request["Authorization"] = ENV['FINTOC_API_KEY']
    request["content-type"] = 'application/json'
    request.body = {
      "link_token" => exchange_token.token
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
      # Maneja el caso de éxito
      puts "Éxito: Link guardado correctamente"
      redirect_to user_links_path(current_user)
    else
      # Maneja el caso de error
      puts "Error: No se pudo guardar el Link"
      puts @link.errors.full_messages
      render :new
    end
  end

  def show
    @link = Link.find(params[:id])
  end

  def index
    @links = Link.all
  end

end
