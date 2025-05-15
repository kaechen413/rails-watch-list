class ReviewsController < ApplicationController

  def create
    @list = List.find(params[:list_id])
    @review = Review.new(strong_params)
    @review.list = @list
    if @review.save
      redirect_to list_path(@list)
    else
      render '../views/lists/show.html.erb', status: :unprocessable_entity # throws a 422 (for Turbo)
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to list_path(@review.list)
  end

  private

  def strong_params
    params.require(:review).permit(:content, :rating)
  end
end
