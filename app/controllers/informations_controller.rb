class InformationsController < ApplicationController
	def new
		@information = Information.new
	end

	def create
		@information = Information.new(information_params)
        @information.company_id = Company.find(params[:company_id])
    	if  @information.save
        	redirect_to company_information_path(@information.id), notice: "新規登録が完了しました"
    	else
        	@company = @informaiton.company_id
        	render 'users/show'
    	end
	end

	def index

	end

	def show

	end

	def edit


	end

	def update

	end

    private

    def information_params
    	params.permit(:introduction, :future, :i_image1, :i_image2, :f_image1, :f_image2)
    end
end
