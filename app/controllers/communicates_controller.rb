class CommunicatesController < ApplicationController
	def new
		@communicate = Communicate.new
		@user = current.user
	end

	def create
	end

	def index
	end

	def show
	end

	private 
	def communicate_params
		params.require(:communicate).permit(:user_id, :destination_id, :title, :body, :is_opened)
    end

end
