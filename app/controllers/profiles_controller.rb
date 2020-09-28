class ProfilesController < ApplicationController
	def new
		@profile = Profile.new
	end

	def create
		@profile = Profile.new(profile_params)
        @profile.user_id = current_user.id
    	if  @profile.save
        	redirect_to profiles_path(@profile.id), notice: "新規登録が完了しました"
    	else
        	@user = current_user(current_user.id)
        	render 'users/show'
    	end
	end

	def index
		@profiles = Profile.all.order(created_at: "DESC")
	end

	def show
		@profile = Profile.find(params[:id])
		@user = @profile.user
		if user_signed_in?
			if CompanyMember.where(user_id: current_user).any?
				@company_member = CompanyMember.find_by(user_id: current_user)
				@company = Company.find(@company_member.company_id)
				if current_user.belongs_to?(@company)
					@talk_room = TalkRoom.find_by(user_id: @user, company_id: @company)
				end
			end
		end
	end

	def edit
		@employment_type = []
		emp_types = Profile.employment_types_i18n
	    [*0...emp_types.length].each do |n|
			@employment_type << [emp_types.values[n], emp_types.invert.values[n]]
		end

		@profile = Profile.find(params[:id])
		if current_user != @profile.user
		redirect_to users_path(current_user)
	    end
	end

	def update
		@profile = Profile.find(params[:id])

		if @profile.update(profile_params)
      		redirect_to profile_path(@profile.id), notice: "プロフィールを変更しました"
        else
      		render "edit"
    	end
	end

    private

    def profile_params
    	params.require(:profile).permit(:introduction, :future, :employment_type)
    end
end
