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
		if Profile.find(params[:id]) == blank? 
			@user = current_user
			redirect_to new_profile_path(current_user.id)
		else
		    @profie = Profile.find(params[:id])
		end
	end

	def edit
	end

	def updage
	end

    private

    def profile_params
    params.permit(:introduction, :future, :employment_type)
    end

	
end
