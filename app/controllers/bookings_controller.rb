class BookingsController < ApplicationController
  before_action :set_pet, only: %i[new create]

  def new
    @booking = Booking.new
  end

  def create
    dates = params[:booking][:start_date].split(" to ")
    start_date = dates.first
    end_date = dates.last
    @booking = Booking.new(start_date: start_date, end_date: end_date)
    @booking.pet = @pet
    @booking.user = current_user
    if @booking.save
      flash.alert = "Your reservation is pending! Wait for owner to confirm :)"
      redirect_to dashboard_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_pet
    @pet = Pet.find(params[:pet_id])
  end

  # def booking_params
  #   params.require(:booking).permit(:start_date, :end_date)
  # end
end
