class Admin::HomesController < ApplicationController

  def top
    @orders = Order.all.order(created_at: :desc)
  end

  #ストロングパラメータ
  def order_params
    params.require(:order).permit(:order_id)
  end
end
