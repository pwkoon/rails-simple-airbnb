class FlatsController < ApplicationController
  before_action :set_flat, only: [:show, :edit, :update, :destroy]

  def index
    @flats = Flat.all
  end

  def show
  end

  def new
    @flat = Flat.new
  end

  def create
    @flat = Flat.new(params_flat)
    if @flat.save
        redirect_to flat_path(@flat)
    else
        render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @flat.update(params_flat)
      redirect_to flat_path(@flat)
  else
      render :edit, status: :unprocessable_entity
  end
  end

  def destroy
    @flat.destroy
    redirect_to flats_path, status: :see_other, alert: "Flat was deleted successfully"
  end

  private

  def params_flat
    params.require(:flat).permit(:name, :address, :description, :price_per_night, :number_of_guests)
  end

  def set_flat
    @flat = Flat.find(params[:id])
  end
end
