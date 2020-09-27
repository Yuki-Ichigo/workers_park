class RecruitmentsController < ApplicationController
	def index
		@works_all = Work.all.order(created_at: "DESC")
		@works = @works_all.where(is_active: true)
	end
end
