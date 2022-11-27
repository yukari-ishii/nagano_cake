class Public::CartItemsController < ApplicationController
  def index
    @cart_items = Cart_item.all
  end

  def update
    @cart_item = Cart_item.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to cart_items_path
  end

  def destroy
    @cart_item = Cart_item.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path
  end

  def destroy_all
    @cart_items = Cart_item.all
    @cart_items.destroy
    redirect_to cart_items_path
  end

  def create
    @cart_item = Cart_item.new(cart_item_params)
    @cart_item.save
    redirect_to admin_genres_path
  end

  #ストロングパラメータ
  def cart_item_params
    params.require(:cart_item).permit(:name, :amount)
  end

end
