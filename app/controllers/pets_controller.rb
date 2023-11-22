class PetsController < ApplicationController
  def index
    @pets = Pet.all
  end

  def show
    pets = Pet.where(id: params[:id]) # collection // array
    if pets.empty?
      flash.alert = "This pet doesn't exist!"
      redirect_to :root
    else
      @pet = pets[0]
    end
  end

  def new
    @pet = Pet.new
  end

  def create
    pet = Pet.new(pet_params)
    pet.user = current_user
    if pet.save
      redirect_to pet_path(pet)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def pet_params
    params.require(:pet).permit(:name, :species, :price, :photo)
  end
end
