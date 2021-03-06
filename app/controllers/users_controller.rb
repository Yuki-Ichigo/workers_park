class UsersController < ApplicationController
	before_action :authenticate_user!

	def show
		@user = current_user
        @companies = @user.companies
        @zip_code =  "〒" + @user.zip_code[0..2] + "-" + @user.zip_code[3..6]
        @address = @user.address_prefecture_name + @user.address_city + @user.address_line1 + @user.address_line2
        @phone_number = @user.phone_number[0..2] + "-" + @user.phone_number[3..6] + "-" + @user.phone_number[7..10]
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

    def destroy_personal_data
    	@user = current_user
    	@user.destroy
    	redirect_to root_path,  notice: "登録情報を削除しました。またのご利用をお待ちしております。"
    end

    def index
    	if current_user.permissions != "admin"
    		@user = current_user
 	  	 	redirect_to user_path(current_user.id)
 	  	else
 	  		@admin = current_user
 	  	 	@users = User.all
 	  	end
    end

    def not_approval
    	@user = User.find(params[:id])
    	if @user.update(permissions: 0)
    		redirect_to users_path
    	else
	    	@admin = current_user
	    	@users = User.all
	    	render 'index'
    	end
    end

    def approval
    	@user = User.find(params[:id])
    	if @user.update(permissions: 1)
    		redirect_to users_path
    	else
	    	@admin = current_user
	    	@users = User.all
	    	render 'index'
    	end
    end
    

    private
  	def user_params
   		params.require(:user).permit(:email, :name, :name_kana, :nic_name, :birthday, :zip_code, :address_prefecture_name, :address_city, :address_line1, :address_line2, :phone_number, {permissions: params[:permissions]}, :image, :sex)
	end
end
