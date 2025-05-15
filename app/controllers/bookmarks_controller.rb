class BookmarksController < ApplicationController

  def new
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
    @movies = Movie.all
  end

  def create
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new(strong_params)
    @bookmark.list = @list
    if @bookmark.save
      redirect_to list_path(@list)
    else
      # when it doesnt save -> show the form again
      render 'lists/show', status: :unprocessable_entity # throws a 422 (for Turbo)
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to list_path(@bookmark.list)
  end

  private

  def strong_params
    params.require(:bookmark).permit(:movie_id, :comment)
  end
end
