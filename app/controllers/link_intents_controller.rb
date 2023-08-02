require 'net/http'

class LinkIntentsController < ApplicationController
  def create
    @link_intent = LinkIntent.new(link_intent_params)
    @link_intent.id_user = current_user.id

    respond_to do |format|
      if @link_intent.save
        begin
          response_body = create_link_intent(@link_intent.product, @link_intent.country, @link_intent.holder_type)
          # Aquí puedes actualizar @link_intent con cualquier dato que quieras de response_body
          # Por ejemplo: @link_intent.update!(widget_token: response_body["widget_token"])
          format.html { redirect_to link_intent_path(@link_intent), notice: 'LinkIntent was successfully created.' }
          format.json { render :show, status: :created, location: @link_intent }
        rescue => e
          # Aquí puedes manejar el error como quieras. Por ejemplo, podrías mostrar un mensaje de error al usuario.
          format.html { render :new, alert: "Hubo un error al crear el Link Intent: #{e.message}" }
          format.json { render json: { error: "Hubo un error al crear el Link Intent: #{e.message}" }, status: :unprocessable_entity }
        end
      else
        format.html { render :new }
        format.json { render json: @link_intent.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @link_intent = LinkIntent.find(params[:id])
  end
  
  private

  def link_intent_params
    params.require(:link_intent).permit(:product, :country, :holder_type)
  end

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

    # Actualiza @link_intent con los datos de la respuesta
    @link_intent.update!(
      object: response_body["object"],
      widget_token: response_body["widget_token"],
      mode: response_body["mode"],
      status: response_body["status"]
      # Agrega aquí cualquier otro campo que quieras guardar
    )

    response_body
  end

end
