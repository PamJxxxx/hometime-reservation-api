class Api::V1::ReservationsController < ApplicationController

  def create
    json_processor = Reservation::JsonProcessor.new
    model          = json_processor.categorize_schema(reservation_params.to_json)
    
    if model.present?
      reservation    = model.begin_transaction(reservation_params) 
      if reservation.errors.present?
        render json: { errors: reservation.errors.full_messages }
      else
        render json: { guest: reservation.guest, reservation: reservation }
      end
    else
      render json: { errors: 'Schema validation error.'}
    end


  end

  private

  def reservation_params
    params.except(:controller, :action)
  end
end
