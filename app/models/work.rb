class Work < ApplicationRecord
	belongs_to :company
	has_many :comment, dependent: :destroy

	validates :introduction, presence: true, length: {maximum: 2000}
	validates :job_details, presence: true, length: {maximum: 2000}

	attachment :image, destroy: false	
end
