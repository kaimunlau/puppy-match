class ReviewsController < ApplicationController
  before_action :set_pet, only: %i[new create]

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.pet = @pet
    if @review.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_pet
    @pet = Pet.find(params[:pet_id])
  end

  def review_params
    params.require(:review).permit(:message, :rating)
  end
end
