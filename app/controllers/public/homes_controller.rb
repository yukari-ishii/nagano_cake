class Public::HomesController < ApplicationController
  
  def top
    @genres = Genre.all #ジャンル検索機能
    @items = Item.all.order(created_at: :desc) #全ての商品を新しい順に取得
  end
  
end
