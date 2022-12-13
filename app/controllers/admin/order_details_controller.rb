class Admin::OrderDetailsController < ApplicationController
  def update
    @order = Order.find(params[:order_id]) #paramsがorder_idのorderを取得
    @order_detail = OrderDetail.find(params[:id]) #OrderDetailモデルから直接、更新したいorder_detailを一つ取り出す
    @order_details = @order.order_details.all
    @order_detail.update(order_detail_params) #order_detailを一つだけ更新
    if @order_detail.making_status == 'making' #商品の製作ステータスが一つでも「製作中」になった場合、注文ステータスを「製作中」に更新する
      @order.update(status: 'making')
    elsif @order_details.count == @order_details.where(making_status: 'finish').count #全ての商品の製作ステータスが「製作完了」になった場合、注文ステータスを「発送準備中」に更新する
      @order.update(status: 'preparing_ship')
    end
    redirect_to admin_order_path(@order.id)
  end

  #ストロングパラメータ
  def order_detail_params
    params.require(:order_detail).permit(:order_id, :item_id, :making_status)
  end

end
