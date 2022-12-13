class Public::CartItemsController < ApplicationController
  def index
    @cart_items = current_customer.cart_items.all #現在のログインユーザーのカート商品データのみ格納する
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to cart_items_path
  end

  def destroy_all
    current_customer.cart_items.destroy_all
    redirect_to cart_items_path
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path
  end

  def create
    @cart_item = CartItem.new(cart_item_params) #フォームからカート内に商品が追加される
    @cart_items = current_customer.cart_items.all #現在ログイン中の会員のカート内商品全てを取得
      ##同一商品がカート内に存在する場合の処理
      @cart_items.each do |cart_item| #カート内商品から一つずつ取り出していく
        if cart_item.item_id == @cart_item.item_id #同じ商品（item_idが同じ）がカート内に存在する場合
          new_amount = cart_item.amount + @cart_item.amount #送られてきた商品の個数を追加して新たな個数とする
          cart_item.update(amount: new_amount) #追加された個数に更新
          @cart_item.delete #送られてきた商品の情報は削除
        end
      end
    @cart_item.save #同一商品が存在しなかった場合、レコードを新規作成して保存
    redirect_to cart_items_path
  end

  private

  #ストロングパラメータ
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :customer_id, :amount)
  end

end
