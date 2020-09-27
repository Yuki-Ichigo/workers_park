class CompaniesController < ApplicationController
	def new
		@company = Company.new
	end

	def create
		@company = Company.new(company_params)
    	if  @company.save
        	redirect_to company_path(@company.id), notice: "新規登録が完了しました"
    	else
        	@user = current_user
        	render 'users/show'
    	end
	end

	def index
		@companies = Company.where(is_active: true)
		if user_signed_in?
			if current_user.admin?
				@companies = Company.all
			end
		else
		@companies = Company.where(is_active: true)
		end
	end

	def show
		@company = Company.find(params[:id])
		@members = @company.users.limit 12
		@user = current_user
		if user_signed_in?
		  @company_member = current_user.company_members.find_by(company_id: @company.id)
		end
	end

	def member_list
		@company = Company.find(params[:id])
		@members = @company.users
	end

	def hide
		@company = Company.find(params[:id])
		@company.update(company_params)
		redirect_to request.referer, notice: "#{@company.name}の利用を停止しました"
	end

	def reopen
		@company = Company.find(params[:id])
		@company.update(is_active: true)
		redirect_to request.referer, notice: "#{@company.name}の利用を再開しました"
	end

	def edit
		@company = Company.find(params[:id])
	end

	def update
		@company = Company.find(params[:id])
		if @company.update(company_params)
      		redirect_to company_path(@company.id), notice: "#{@company.name}の会社情報を更新しました"
        else
      		@company = Company.find(params[:id])
      		render "edit"
    	end		
	end

	def information
		@company = Company.find(params[:id])
	end

	def info_up
		@company = Company.find(params[:id])
		if @company.update(company_params)
      		redirect_to company_path(@company.id), notice: "#{@company.name}の会社情報を更新しました"
        else
      		@company = Company.find(params[:id])
      		render "edit"
    	end
	end

	private
  	def company_params
   		params.require(:company).permit(:name, :name_kana, :phone_number, :establishment, :url, :email, :zip_code, :address_prefecture, :address_city, :address_line1, :address_line2, :image, :is_active, :introduction, :future, :i_image1, :i_image2, :f_image1, :f_image2)
	end

end
