class AddRefToTimesheets < ActiveRecord::Migration
  def change
    add_reference :timesheets, :project, index: true, foreign_key: true
  end
end
