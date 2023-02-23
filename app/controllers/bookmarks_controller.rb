class BookmarksController < ApplicationController
  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list_id = params.require(:list_id)
    if @bookmark.save
      redirect_to list_path(@bookmark.list_id)
    else
      redirect_to list_path(@bookmark.list_id)
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to list_path(@bookmark.list_id), status: :see_other
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end
end
