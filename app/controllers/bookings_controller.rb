class BookingsController < ApplicationController
  before_action :set_pet, only: %i[new create]
  skip_before_action :verify_authenticity_token, only: %i[update]

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

  def update
    booking = Booking.find(params[:id])
    booking.status = params[:status]
    respond_to_booking_update(booking) if booking.update(booking_params)
  end

  private

  def respond_to_booking_update(booking)
    respond_to do |format|
      format.json do
        render json: {
          new_status: booking.status
        }
      end
    end
  end

  def set_pet
    @pet = Pet.find(params[:pet_id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :status)
  end
end
