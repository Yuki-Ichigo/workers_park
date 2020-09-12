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

    def index
    	if current_user.permissions != "管理者"
    		@user = current_user
 	  	 	redirect_to user_path(current_user.id)
 	  	else
 	  		@admin = current_user
 	  	 	@users = User.all
 	  	end
    end

    def not_approval
    	@user = User.find(params[:id])
    	if @user.update(permissions: '一般')
    		redirect_to users_path
    	else
	    	@admin = current_user
	    	@users = User.all
	    	render 'index'
    	end
    end

    def approval
    	@user = User.find(params[:id])
    	if @user.update(permissions: '企業担当者')
    		redirect_to users_path
    	else
	    	@admin = current_user
	    	@users = User.all
	    	render 'index'
    	end
    end
    

    private
  	def user_params
   		params.require(:user).permit(:email, :name, :name_kana, :nic_name, :birthday, :zip_code, :address_prefecture_name, :address_city, :address_line1, :address_line2, :phone_number, :permissions, :image, :sex)
	end
end
