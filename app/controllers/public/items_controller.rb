class Public::ItemsController < ApplicationController
  
  def index
    @items = Item.all
    @genres = Genre.all #ジャンル検索機能
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
    @genres = Genre.all #ジャンル検索機能
  end

end
