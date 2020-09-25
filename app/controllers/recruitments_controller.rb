class RecruitmentsController < ApplicationController
	def index
		@works = Work.all.order(created_at: "DESC")
	end
end
