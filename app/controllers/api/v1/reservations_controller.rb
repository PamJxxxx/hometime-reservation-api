class Api::V1::ReservationsController < ApplicationController
  def create
    @reservation_subclass = Reservation::JsonProcessor.new.categorize_schema(reservation_params.to_json)

    if @reservation_subclass.present?
      @model_transaction = @reservation_subclass.begin_transaction(reservation_params)
      @model_transaction.errors.present? ? render_failed_reservation : render_success_reservation
    else
      render_invalid_schema
    end
  end

  private

  def render_failed_reservation
    reservation_errors = @model_transaction.reservations
                                           .filter { |reservation| reservation.errors.present? }
                                           .map(&:errors)
    @model_transaction.errors.delete(:reservations)
    render json: { errors: { guest: @model_transaction.errors, reservations: reservation_errors[0] } }
  end

  def render_success_reservation
    render json: { guest: @model_transaction, reservation: @model_transaction.reservations }
  end

  def render_invalid_schema
    render json: { errors: 'Validation error in: Schema' }
  end

  def reservation_params
    params.except(:controller, :action)
  end
end
