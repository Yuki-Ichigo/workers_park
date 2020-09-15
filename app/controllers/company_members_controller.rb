class CompanyMembersController < ApplicationController
	def create	
		company = Company.find(params[:company_id])
		user =  current_user
	    company_member = CompanyMember.new(company_member_params)
	    company_member.user_id = user.id
	    company_member.company_id = company.id
	    company_member.save
	    redirect_to company_path(company.id)
	end

	def destroy
		company = Company.find(params[:company_id])
		company_member = current_user.company_members.find_by(company_id: company.id)
		company_member.destroy
	    redirect_to company_path(company.id)
	end

	private
  	def company_member_params
  		params.permit(:user_id, :company_id)
	end
end
