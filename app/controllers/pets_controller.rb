class PetsController < ApplicationController
  def index
    @pets = Pet.all
  end

  def show
    pets = Pet.where(id: params[:id]) #collection // array
    if !pets.empty?
      @pet = pets[0]
    else
      flash.alert = "This pet doesn't exist!"
      redirect_to :root
    end
  end
end
