class AlibisController < ApplicationController
  before_action :set_alibi, only: %i[show edit update archive]
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @alibis = Alibi.all
  end

  def show
    @alibi = Alibi.find(params[:id])
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
      redirect_to edit_alibi_path(@alibi), notice: 'Alibi has been successfully archived.'
    else
      redirect_to edit_alibi_path(@alibi), alert: 'Error archiving alibi.'
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
    params.require(:alibi).permit(:title, :content, :status, :image, :category, :date, :price)
  end

  def set_alibi
    @alibi = Alibi.find(params[:id])
  end
end
