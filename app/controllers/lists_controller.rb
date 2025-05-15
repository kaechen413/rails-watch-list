class ListsController < ApplicationController
  def index
    @lists = List.all
    @list = List.new
  end

  def show
    @list = List.find(params[:id])
    @bookmarks = @list.bookmarks
    @bookmark = Bookmark.new
    @review = Review.new
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(strong_params)
    if @list.save
      redirect_to lists_path
    else
      # when it doesnt save -> show the form again
      render 'index', status: :unprocessable_entity # throws a 422 (for Turbo)
    end
  end

  private

  def strong_params
    params.require(:list).permit(:name)
  end
end
