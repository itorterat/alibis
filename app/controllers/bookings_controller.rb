class BookingsController < ApplicationController
  before_action :set_booking, only: %i[show edit accept decline cancel]

  def index
    @bookings = Booking.all
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new
    @booking.status = :pending
    @booking.alibi = Alibi.find(params[:alibi_id])
    @booking.user = current_user
    if @booking.save
      redirect_to @booking.alibi
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def edit; end

  def accept
    @alibi = @booking.alibi
    if @booking.update(status: :approved)
      redirect_to alibi_path(@alibi), notice: 'Booking has been successfully accepted.'
    else
      redirect_to alibi_path(@alibi), alert: 'Error accepting booking.'
    end
  end

  def decline
    @alibi = @booking.alibi
    if @booking.update(status: :declined)
      redirect_to alibi_path(@alibi), notice: 'Booking has been successfully declined.'
    else
      redirect_to alibi_path(@alibi), alert: 'Error declining booking.'
    end
  end

  def cancel
    @alibi = @booking.alibi
    if @booking.update(status: :cancelled)
      redirect_to alibi_path(@alibi), notice: 'Booking has been successfully cancelled.'
    else
      redirect_to alibi_path(@alibi), alert: 'Error cancelling booking.'
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
