class Project < ActiveRecord::Base
	has_many :timesheets
	validates :name,:description,presence: true
end
