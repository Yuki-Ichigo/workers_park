class HomeController < ApplicationController

	def top
		@works = Work.all.order(created_at: :desc).limit 6

	end

	def about
	end
	
end
