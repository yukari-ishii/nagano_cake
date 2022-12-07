class Public::AddressesController < ApplicationController

  def index
    @addresses = current_customer.addresses.all #現在のログインユーザーの配送先データのみ格納
    @address = Address.new #配送先追加登録のための変数
  end

  def create
    @address = Address.new(address_params)
    @address.customer_id = current_customer.id #customer_idのキーはログインユーザーのidとする
    @address.save #データを保存
    redirect_to addresses_path #保存後はindex画面に
  end

  def edit
    @address = Address.find(params[:id])
  end

  def update
    @address = Address.find(params[:id])
    @address.update(address_params)
    redirect_to addresses_path #更新後はindex画面に
  end

  def destroy
    @address = Address.find(params[:id])
    @address.destroy #レコードを削除
    redirect_to addresses_path #削除後はindex画面に
  end

  private

  #ストロングパラメータ
  def address_params
    params.require(:address).permit(:customer_id, :name, :postal_code, :address)
  end
end
