class WorksController < ApplicationController
	
	def create
		@work = Work.new(work_params)	
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
