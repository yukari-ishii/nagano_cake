# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  
   ##sessionsコントローラのcreateアクションを実行する前に退会しているか確認する
   before_action :customer_state, only: [:create]
   
  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

    protected
    #退会しているかを判断するメソッド
    def customer_state
      #入力されたemailからアカウントを1件取得
      @customer = Customer.find_by(email: params[:customer][:email])
      #アカウントを取得できなかった場合、このメソッドを終了する
      return if !@customer
      #取得したアカウントのpwと入力されたpwが一致し、退会状態である
      if @customer.valid_password?(params[:customer][:password]) && (@customer.is_deleted == true)
        redirect_to new_customer_registration_path #退会済のため、サインアップ画面に遷移
      end
    end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
