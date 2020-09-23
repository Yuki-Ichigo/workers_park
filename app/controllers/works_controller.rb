class WorksController < ApplicationController
	
	def new
		@work = Work.new	
		@company = Company.find(params[:company_id])
	end

	def create
		@work = Work.new(work_params)
		@work.user_id = current_user.id
		@company = Company.find(params[:company_id])
		@work.company_id = @company.id
    	if  @work.save
        	redirect_to company_work_path(@company, @work.id), notice: "新規登録が完了しました"
    	else
		@company = Company.find(params[:company_id])
        render 'new'
    	end
	end

	def index
		@company = Company.find(params[:company_id])
		@works = @company.works
	end

	def hide
		@work = Work.find(params[:id])
		@work.user_id = current_user.id
		@company = Company.find(params[:company_id])
		@work.company_id = @company.id
		@work.update(is_active: false)
		redirect_to company_works_path, notice: "#{@company.name}の利用を停止しました"
	end

	def reopen
		@work = Work.find(params[:id])
		@work.user_id = current_user.id
		@company = Company.find(params[:company_id])
		@work.company_id = @company.id
		@work.update(is_active: true)
		redirect_to company_works_path, notice: "#{@company.name}の利用を再開しました"
	end

	def show
		@work = Work.find(params[:id])
		@work.user_id = current_user.id
		@company = Company.find(params[:company_id])
		@members = @company.users
		belongsCompany = CompanyMember.find_by(user_id: current_user.id)
		@talk_room = TalkRoom.find_by(company_id: @work.company, user_id: current_user.id)
	end

	def edit
		@work = Work.find(params[:id])
		@work.user_id = current_user.id
		@company = Company.find(params[:company_id])
	end

	def update
		@work = Work.find(params[:id])
		@work.user_id = current_user.id
		@company = Company.find(params[:company_id])
		@work.company_id = @company.id
		@work.update(work_params)
		redirect_to company_work_path, notice: "#{@company.name}の求人内容を更新しました"
	end

	private
  	def work_params
   		params.require(:work).permit(:company_id, :user_id, :title, :introduction, :job_details, :image, :is_active)
	end

end
