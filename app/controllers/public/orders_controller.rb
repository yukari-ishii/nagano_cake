class Public::OrdersController < ApplicationController
  
  def new
    @order = Order.new
  end
  
  def confirm
    
  end
  
  def complete
    
  end
  
  def create
    @order = Order.new(order_params)
    @order.save
    redirect_to admin_genres_path
  end
  
  def index
    @orders = Order.all
  end
  
  def show
    @order = Order.find(params[:id])
  end
  
  private
  
  #ストロングパラメータ
  def order_params
    params.require(:order).permit(:postal_code, :address, :name)
  end
end
