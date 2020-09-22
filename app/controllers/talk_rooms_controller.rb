class TalkRoomsController < ApplicationController
	before_action :authenticate_user!

	def new

	end

	# 会社側からのアクション
	def create
		# TalkRoomから既存のTalkRoomを検索
		# TalkRoomにcomapny id とuser idのマッチングがあれば既存のテーブルを返しtalk_room_path(@talk_room.id)に遷移する
		# なければ新たにTolkRoomを作成してtalk_room_path(@talk_room.id)に遷移する
		@talk_room = TalkRoom.new(talk_room_params)
		@talk_room.user_id = current_user.id
		@talk_room.company = Company.find(params[:company_id])
		@talk_room.company_id = @talk_room.company.id
		if TalkRoom.where(company_id: @talk_room.company, user_id: @talk_room.user_id).blank?
			@talk_room.save
			redirect_to talk_room_path(@talk_room.id)
		else
			render 'show'
		end
	end
	
	def index
		# 自身が所属しているTalkRoomの一覧を取得
		# CompanyMembersを検索して自身が所属する企業のIDと一致して
		# かつAdmin権限が存在している場合は表示する
		user =  User.find(current_user.id)
		belongsCompany = CompanyMember.find_by(user_id: current_user.id)
		if (user.permissions == 1 && belongsCompany.company_id == params[:company_id])
		 @talk_rooms = TalkRoom.where(company_id: params[:company_id])
		elsif TalkRoom.find_by(user_id: current_user.id)
		 @talk_rooms = TalkRoom.where(user_id: current_user.id)
		end
		#@talk_rooms = TalkRoom.where(company_id: params[:company_id])
		@company = Company.find(belongsCompany.company_id)
	end

	def show 
		@talk_room = TalkRoom.find(params[:id])
		@company_id = @talk_room.company_id
		@talks = Talk.where(talk_room_id: params[:id])
	end

	def destroy
	end
	# 会社側

	# 個人側からのアクション
	def make
		@talk_room = TalkRoom.new(talk_room_params)
		@talk_room.user_id = current_user.id
		@talk_room.company = Company.find(params[:company_id])
		@talk_room.company_id = @talk_room.company.id
		if TalkRoom.where(company_id: @talk_room.company, user_id: @talk_room.user_id).blank?
			@talk_room.save
			redirect_to detail_talk_room_path(@talk_room.id)
		else
			redirect_to talk_room_lists_path
		end
	end

	def list
		@talk_rooms = TalkRoom.where(user_id: current_user.id)
	end

	def detail
		@talk_room = TalkRoom.find(params[:talk_room_id])
		@talks = Talk.where(talk_room_id: @talk_room.id)
	end
	# 個人

	private 
	def talk_room_params
		params.permit(:company_id, :user_id)
    end



end
