class ReviewsController < ApplicationController

  # before_filter :authorize_user

  def new
    @review = Review.new
  end

  def create
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new(review_params)
    @review.user_id = current_user.id
    @review.save
    redirect_to product_path(@product)
  end

  private
    def review_params
      params.require(:review).permit(:description, :rating, :user_id, :product_id)
    end

    def authorize_user
      if !current_user
        redirect_to root_path, notice: "Nice try, bub."
      end
    end

end
