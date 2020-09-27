class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?

	def after_sign_in_path_for(resource)
	  user_path(current_user) # ログイン後に遷移するpathを設定
	end

	def after_sign_out_path_for(resource)
	  root_path # ログアウト後に遷移するpathを設定
	end


  	protected
	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :name_kana, :nic_name, :sex, :birthday, :zip_code, :address_prefecture_name, :address_city, :address_line1, :address_line2, :phone_number, :password, :password_confirmation, :email, :image])
	end
end
