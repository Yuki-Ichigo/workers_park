class WorksController < ApplicationController
	
	def new
		if user_signed_in?
			@work = Work.new
			@company = Company.find(params[:company_id])
			if current_user.belongs_to?(@company) == false
				redirect_to user_path(current_user)
			end
		else
			redirect_to root_path
		end
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
		if user_signed_in?
			if current_user.belongs_to?(@company)
			  @works = @company.works
			else
			  @works = @company.works.where(is_active: true)
			end
		else
			@works = @company.works.where(is_active: true)
		end
	end

	def hide
		@work = Work.find(params[:id])
		@work.user_id = current_user.id
		@company = Company.find(params[:company_id])
		@work.company_id = @company.id
		@work.update(is_active: false)
		redirect_to company_works_path, notice: "#{@work.title}の掲載を停止しました"
	end

	def reopen

		@work = Work.find(params[:id])
		@work.user_id = current_user.id
		@company = Company.find(params[:company_id])
		@work.company_id = @company.id
		@work.update(is_active: true)
		redirect_to company_works_path, notice: "#{@work.title}の掲載を再開しました"
	end

	def show
		@work = Work.find(params[:id])
		@company = Company.find(params[:company_id])
	    @members = @company.users.limit 12
		if user_signed_in?
		  @work.user_id = current_user.id
		  if CompanyMember.find_by(user_id: current_user.id).present?
		      belongsCompany = CompanyMember.find_by(user_id: current_user.id)
		      @belongs_company = Company.find(belongsCompany.company_id)
	  	  end
		  @talk_room = TalkRoom.find_by(company_id: @work.company, user_id: current_user.id)
		end
	end

	def edit
		if user_signed_in?
			@work = Work.find(params[:id])
			@work.user_id = current_user.id
			@company = Company.find(params[:company_id])
			if current_user.belongs_to?(@company) == false
				redirect_to user_path(current_user)
			end
		else
			redirect_to root_path
		end
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
