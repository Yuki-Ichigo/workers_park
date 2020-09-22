class HomeController < ApplicationController

	def top
		@works = Work.all
	end

	def about
	end
	
end
