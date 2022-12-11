class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details.all #@orderに紐づく注文詳細のレコードを全て取得
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    redirect_to admin_order_path(@order.id)
  end

  #ストロングパラメータ
  def order_params
    params.require(:order).permit(:postal_code, :address, :name, :status, :payment_method, :customer_id, :shipping_cost, :total_payment)
  end
end
