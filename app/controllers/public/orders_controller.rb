class Public::OrdersController < ApplicationController
  
  def index
    @orders = current_customer.orders
  end
  
  def show
    @order = Order.find(params[:id])
    @orders = current_customer.orders
  end
  
  def new
    @order = Order.new
    @addresses = Address.all
  end
  
  def confirm
    @order = Order.new(order_params)
    if params[:order][:select_address] == "0" #自身の住所
      #空のカラムに代入する
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name
    elsif params[:order][:select_address] == "1" #登録済住所から選択
      #セレクトボックスで取得したaddress_idで探したaddressを代入
      @address = Address.find(params[:order][:address_id])
      #空のカラムに代入する
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name
    elsif params[:order][:select_address] == "2" #新しい住所
      @order.customer_id = current_customer.id
    end
      @cart_items = current_customer.cart_items
      @order_new = Order.new
      render :confirm
  end

  def create
    order = Order.new(order_params)
    order.save
    @cart_items = current_customer.cart_items.all
    
    @cart_items.each do |cart_item|
      #order_detailsテーブルのカラムに値を保存する
      @order_details = OrderDetail.new
      @order_details.order_id = order.id
      @order_details.item_id = cart_item.item.id
      @order_details.price = cart_item.item.price
      @order_details.amount = cart_item.amount
      @order_details.making_status = 0
      @order_details.save
    end
    
    CartItem.destroy_all #カート内の商品をすべて削除
    redirect_to orders_complete_path
  end
  
  ##注文testを削除するためのコントローラ、後で消す機能
  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    redirect_to orders_path
  end

  private

  #ストロングパラメータ
  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :name, :shipping_cost, :total_payment, :customer_id, :status)
  end
end
