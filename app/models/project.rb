class Project < ActiveRecord::Base
	has_many :timesheets
	accepts_nested_attributes_for :timesheets

	validates :name,:description,presence: true
end
