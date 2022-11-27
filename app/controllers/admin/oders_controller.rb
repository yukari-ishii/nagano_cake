class Admin::OdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
  end
  
  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    redirect_to admin_order_path(@order.id)
  end
    
  #ストロングパラメータ
  def order_params
    params.require(:order).permit(:postal_code, :address, :name, :status)
  end
end
