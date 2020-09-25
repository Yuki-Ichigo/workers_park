class TalkRoomsController < ApplicationController
	before_action :authenticate_user!

	def new

	end

	def create
		@talk_room = TalkRoom.new(talk_room_params)
		@talk_room.user_id = current_user.id
		@talk_room.company = Company.find(params[:company_id])
		@talk_room.company_id = @talk_room.company.id
		if TalkRoom.where(company_id: @talk_room.company, user_id: @talk_room.user_id).blank?
			@talk_room.save
			redirect_to talk_room_path(@talk_room.id)
		else
			redirect_to request.referer
		end
	end
	
	def index
		belongsCompany = CompanyMember.find_or_initialize_by(user_id: current_user.id)
		@company = Company.find_or_initialize_by(id: belongsCompany.company_id)
		if current_user.belongs_to?(@company)
		 @talk_rooms = TalkRoom.where(company_id: @company.id).order(created_at: "DESC")
		elsif TalkRoom.find_by(user_id: current_user.id)
		 @talk_rooms = TalkRoom.where(user_id: current_user.id).order(created_at: "DESC")
		end
	end

	def show 
		@talk_room = TalkRoom.find(params[:id])
		@company_id = @talk_room.company_id
		@talks = Talk.where(talk_room_id: params[:id])
	end

	def destroy
	end

	private 
	def talk_room_params
		params.permit(:company_id, :user_id)
    end

    def user_id
    end



end
