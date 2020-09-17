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
        	@user = current_user
        	render 'users/show'
    	end
	end

	def index
		@works = Work.all
	end

	def show
	end

	def edit
	end

	private
  	def work_params
   		params.require(:work).permit(:company_id, :user_id, :title, :introduction, :job_details, :image, :is_active)
	end

end
