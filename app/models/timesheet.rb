class Timesheet < ActiveRecord::Base
	belongs_to :project
	validates :description,:hours,presence: true
end
