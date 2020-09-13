class CompaniesController < ApplicationController

	def create
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
  	def company_params
   		params.require(:company).permit(:name, :name_kana, :phone_number, :establishment, :url, :email, :zip_code, :address_prefecture, :address_city, :address_line1, :address_line2, :image, :is_active)
	end
end
