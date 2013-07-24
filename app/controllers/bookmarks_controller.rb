class BookmarksController < ApplicationController
  before_filter :authenticate_user!

  def new
    build_resource
  end

  def create
    @bookmark = build_resource
    @bookmark.author = current_user
    if @bookmark.save
      flash[:notice] = 'Bookmark saved'
      redirect_to bookmarks_path
    else
      render 'new'
    end
  end

  def index
    collection
  end

  protected
  def build_resource
    @bookmark ||= Bookmark.new(bookmark_params)
  end

  def collection
    @bookmarks ||= Bookmark.page
  end

  def bookmark_params
    params.permit(bookmark: Bookmark.mass_assignable_attrs)[:bookmark]
  end
end
