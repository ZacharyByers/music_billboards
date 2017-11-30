class SongsController < ApplicationController
  before_action :set_album
  before_action :set_song, only: [:show, :edit, :update, :destroy]

  def show
  end

  def new
    @song = @album.songs.new
    render "new_or_edit"
  end

  def edit
    render "new_or_edit"
  end

  def create
    @song = @album.songs.new(song_params)
    if @song.save
      redirect_to artist_album_path(@album.artist_id, @album)
    else
      render "new_or_edit"
    end
  end

  def update
    if @song.update(song_params)
      redirect_to artist_album_path(@album.artist_id, @album)
    else
      render "new_or_edit"
    end
  end

  def destroy
    @song.destroy
    redirect_to artist_album_path(@album.artist_id, @album)
  end

  private

  def song_params
    params.require(:song).permit(:title, :billboard_id)
  end

  def set_album
    @album = Album.find(params[:album_id])
  end

  def set_song
    @song = @album.songs.find(params[:id])
  end
end
