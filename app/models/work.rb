class Work < ApplicationRecord
	belongs_to :company

	validates :introduction, presence: true, length: {maximum: 500}
	validates :job_details, presence: true, length: {maximum: 2000}

	attachment :image, destroy: false	
end
