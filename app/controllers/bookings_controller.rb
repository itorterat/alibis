class BookingsController < ApplicationController
  before_action :set_booking, only: %i[show edit accept decline cancel]

  def index
    @bookings = Booking.all
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.status = :pending
    if @booking.save
      redirect_to @booking
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def edit; end

  def accept
    if @booking.update(status: :accepted)
      redirect_to edit_alibi_path(@booking), notice: 'Booking has been successfully accepted.'
    else
      redirect_to edit_alibi_path(@booking), alert: 'Error accepting booking.'
    end
  end

  def decline
    if @booking.update(status: :declined)
      redirect_to edit_alibi_path(@booking), notice: 'Booking has been successfully declined.'
    else
      redirect_to edit_alibi_path(@booking), alert: 'Error declining booking.'
    end
  end

  def cancel
    if @booking.update(status: :cancelled)
      redirect_to edit_alibi_path(@booking), notice: 'Booking has been successfully cancelled.'
    else
      redirect_to edit_alibi_path(@booking), alert: 'Error cancelling booking.'
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:status)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end
end
