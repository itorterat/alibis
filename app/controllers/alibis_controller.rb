class AlibisController < ApplicationController
  before_action :set_alibi, only: %i[show edit update archive]

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
    if @alibi.save
      redirect_to alibi_path(@alibi), notice: "Alibi was successfully created!"
    else
      render :new, status: :unprocessable_entity
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
