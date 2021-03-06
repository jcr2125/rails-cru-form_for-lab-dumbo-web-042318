class SongsController < ApplicationController

  before_action :find_song, only: [:show, :edit, :update]

  def index
    @songs = Song.all
  end

  def new
    @song = Song.new
  end

  def create
    @song= Song.new(song_params)
    if @song.save
      redirect_to @song
    else
      render "new"
    end
  end

  def show
  end

  def edit
  end

  def update
    if @song.update(song_params)
      redirect_to @song
    else
      render "edit"
    end
  end

  private

  def find_song
    @song = Song.find(params[:id])
  end

  def song_params
    params.require(:song).permit(:name, :artist_id, :genre_id)
  end

end
