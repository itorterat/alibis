class AlibisController < ApplicationController
  before_action :set_alibi, only: %i[show edit update archive]
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @alibis = Alibi.all
    if params[:query].present?
      @alibis = @alibis.where(category: params[:query])
    end
  end

  def show
    @alibi = Alibi.find(params[:id])
    @booking = Booking.new
  end

  def new
    @alibi = Alibi.new
  end

  def create
    @alibi = Alibi.new(alibi_params)
    @alibi.user = current_user
    @alibi.available!
    if @alibi.save
      redirect_to alibi_path(@alibi), notice: "Alibi was successfully created!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def archive
    if @alibi.archived!
      redirect_to alibis_path, notice: 'Alibi has been successfully archived.'
    else
      redirect_to alibi_path(@alibi), alert: 'Error archiving alibi.'
    end
  end

  def edit; end

  def update
    if @alibi.update(alibi_params)
      redirect_to alibi_path(@alibi), notice: "Alibi was successfully updated!"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def alibi_params
    params.require(:alibi).permit(:title, :content, :status, :image, :category, :date, :price, :photo, :goal)
  end

  def set_alibi
    @alibi = Alibi.find(params[:id])
  end

end
