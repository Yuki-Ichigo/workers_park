class UsersController < ApplicationController
	before_action :authenticate_user!

	def show
		@user = current_user
	end

	def edit
		@user = current_user
	end

	def update
		@user = current_user
		if @user.update(user_params)
      		redirect_to user_path(current_user.id), notice: "基本登録情報を変更しました"
        else
      		@user = current_user   
      		render "edit"
    	end
	end

	def hide
		@user = current_user
    end

    def destroy
    	@user = current_user
    	@user.destroy
    	redirect_to root_path
    end

    def secret
    end

    private
  	def user_params
   		params.require(:user).permit(:email, :name, :name_kana, :nic_name, :birthday, :zip_code, :address_prefecture_name, :address_city, :address_line1, :address_line2, :phone_number, :permissions, :image, :sex)
	end
end
