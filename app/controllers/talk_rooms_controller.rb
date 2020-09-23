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
			redirect_to request.referer
		end
	end
	
	def index		
		# もしこの会社の企業担当者なら、

		# 自身が所属しているTalkRoomの一覧を取得
		# CompanyMembersを検索して自身が所属する企業のIDと一致して
		# かつAdmin権限が存在している場合は表示する
		belongsCompany = CompanyMember.find_or_initialize_by(user_id: current_user.id)
		@company = Company.find_or_initialize_by(id: belongsCompany.company_id)
		if current_user.belongs_to?(@company)
		 @talk_rooms = TalkRoom.where(company_id: @company.id)
		elsif TalkRoom.find_by(user_id: current_user.id)
		 @talk_rooms = TalkRoom.where(user_id: current_user.id)
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
