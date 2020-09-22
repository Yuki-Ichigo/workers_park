class RecruitmentsController < ApplicationController
	def index
		@works = Work.all
	end
end
