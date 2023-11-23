class PetsController < ApplicationController
  before_action :set_pet, only: %i[edit update destroy]

  def index
    @pets = Pet.all
    @markers = @pets.map do |pet|
      {
        lat: pet.user.latitude,
        lng: pet.user.longitude,
        marker_html: render_to_string(partial: "map_marker")
      }
    end
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
    @pet = Pet.new(pet_params)
    @pet.user = current_user
    if @pet.save
      redirect_to pet_path(@pet)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @pet.update(pet_params)
      redirect_to dashboard_path, notice: 'Ton Pet est bien modifié !'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @pet.destroy
    redirect_to dashboard_path, notice: 'Ton Pet est supprimé!', status: :see_other
  end

  private

  def set_pet
    @pet = Pet.find(params[:id])
  end

  def pet_params
    params.require(:pet).permit(:name, :species, :price, :photo)
  end
end
