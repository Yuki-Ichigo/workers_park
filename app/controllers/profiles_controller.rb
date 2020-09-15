class ProfilesController < ApplicationController

	def create
		@profile = Profile.new(profile_params)
        @profile.user_id = current_user.id
    	if  @profile.save
        	redirect_to edit_profile_path(@profile.id), notice: "新規登録が完了しました"
    	else
        	@user = current_user(current_user.id)
        	render 'users/show'
    	end
	end

	def index
		@profiles = Profile.all
	end

	def show
		@profile = Profile.find(params[:id])
	end

	def edit
		@profile = Profile.find(params[:id])
	end

	def update
		@profile = Profile.find(params[:id])

		if @profile.update(profile_params)
      		redirect_to edit_profile_path(@profile.id), notice: "プロフィールを変更しました"
        else
      		@profile.id = current_user.profile.id   
      		render "edit"
    	end
	end

    private

    def profile_params
    	params.permit(:introduction, :future, :employment_type)
    end
end
