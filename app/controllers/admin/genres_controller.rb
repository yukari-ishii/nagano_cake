class Admin::GenresController < ApplicationController

  def index
    #ジャンル新規登録のための変数
    @genre = Genre.new
    #ジャンル一覧表示のための変数
    @genres = Genre.all
  end

  def create
    @genre = Genre.new(genre_params)
    @genre.save
    redirect_to admin_genres_path
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
    @genre.update(genre_params)
    redirect_to admin_genres_path
  end

  def show
    @genres = Genre.all #ジャンル検索機能
    @genre = Genre.find(params[:id])
  end

  def destroy
    @genre = Genre.find(params[:id])
    @genre.destroy
    redirect_to admin_genres_path
  end

  private

  #ストロングパラメータ
  def genre_params
    params.require(:genre).permit(:name)
  end

end
