class CreateTimesheets < ActiveRecord::Migration
  def change
    create_table :timesheets do |t|
      t.integer :project_id
      t.text :description
      t.integer :hours

      t.timestamps null: false
    end
  end
end
