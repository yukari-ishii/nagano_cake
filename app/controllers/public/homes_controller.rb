class Public::HomesController < ApplicationController
  
  def top
    @genres = Genre.all #ジャンル検索機能
  end
  
end
