class AlbumsController < ApplicationController
  before_action :set_artist
  before_action :set_album, only: [:show, :edit, :update, :destroy]

  def show
  end

  def new
    @album = @artist.albums.new
    render "new_or_edit"
  end

  def edit
    render "new_or_edit"
  end

  def create
    @album = @artist.albums.new(album_params)
    if @album.save
      redirect_to artist_path(@artist)
    else
      render "new_or_edit"
    end
  end

  def update
    if @album.update(album_params)
      redirect_to artist_path(@artist)
    else
      render "new_or_edit"
    end
  end

  def destroy
    @album.destroy
    redirect_to artist_path(@artist)
  end

  private

  def album_params
    params.require(:album).permit(:title)
  end

  def set_artist
    @artist = Artist.find(params[:artist_id])
  end

  def set_album
    @album = @artist.albums.find(params[:id])
  end
end
