class RemoveProjidFromtimesheets < ActiveRecord::Migration
  def change
  	remove_column :timesheets,:project_id
  end
end
