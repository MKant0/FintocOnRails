class ExchangeTokensController < ApplicationController
  def create
    @exchange_token = ExchangeToken.new(exchange_token_params)

    if @exchange_token.save
      render json: { status: 'success', message: 'ExchangeToken was successfully created.' }
    else
      render json: { status: 'error', message: @exchange_token.errors.full_messages.to_sentence }, status: :unprocessable_entity
    end
  end

  def index
    @exchange_tokens = ExchangeToken.all
  end

  private

  def exchange_token_params
    params.require(:exchange_token).permit(:token, :link_intent_id)
  end
end
