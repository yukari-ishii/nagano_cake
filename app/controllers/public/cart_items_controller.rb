class Public::CartItemsController < ApplicationController
  def index
    @cart_items = CartItem.all
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to cart_items_path
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path
  end

  def destroy_all
    @cart_items = CartItem.all
    @cart_items.destroy
    redirect_to cart_items_path
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_items = current_customer.cart_items.all
    @cart_items.each do |cart_item|
      if cart_item.item_id == @cart_item.item_id
      new_amount = cart_item.amount + @cart_item.amount
      cart_item.update(amount: new_amount)
      @cart_item.delete
      end
    end
    @cart_item.save
    redirect_to cart_items_path
  end

  private

  #ストロングパラメータ
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :customer_id, :amount)
  end

end
