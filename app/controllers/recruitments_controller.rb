class RecruitmentsController < ApplicationController
	def index
		@recruitments = Work.all
	end
end
