class Public::CustomersController < ApplicationController
  
  def edit
    @customer = current_customer
  end
  
  def update
    @customer = current_customer
    @customer.update(customer_params)
    redirect_to customers_my_page_path
  end
  
  def withdraw
    @customer = Customer.find(current_customer.id) #現在ログインしているユーザー
    @customer.update(is_deleted: true) #退会ステータスをtrueにupdate
    reset_session #セッション情報を全て削除
    redirect_to root_path #退会後、トップ画面に遷移
  end
  
  private

  #ストロングパラメータ
  def customer_params
    params.require(:customer).permit(:email, :last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :is_deleted)
  end

end
