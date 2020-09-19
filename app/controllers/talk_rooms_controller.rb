class TalkRoomsController < ApplicationController
	before_action :authenticate_user!

	def new

	end

	def create
		@talk_room = TalkRoom.new(talk_room_params)
		@talk_room.user_id = current_user.id
		if @talk_room.save
			redirect_to talk_room_path(@talk_room.id)
		end
	end

	def index
		@talk_rooms = TalkRoom.where(company_id: params[:company_id])
		@company = Company.find(params[:company_id])
	end

	def show 
		@talk_room = TalkRoom.find(params[:id])
		@company_id = @talk_room.company_id
		@talks = Talk.where(params[:id])
	end

	def destroy
	end

	private 
	def talk_room_params
		params.permit(:company_id)
    end

end
