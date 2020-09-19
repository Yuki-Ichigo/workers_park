class TalksController < ApplicationController
	def new
		@talk = Talk.new
	end

	def create
		@talk = Talk.new(talk_params)
		@talk_room = TalkRoom.find(params[:talk_room_id])
		@talk.talk_room_id = @talk_room.id
		@talk.user_id = current_user.id
		if @talk.save
			redirect_to talk_room_path(@talk_room)
		else
			redirect_to talk_room_path(@talk_room), notice: "投稿に失敗しました"
		end
	end

	def destroy
	end

	private 
	def talk_params
		params.permit(:talk_room_id, :user_id, :body, :is_opened)
    end
end
