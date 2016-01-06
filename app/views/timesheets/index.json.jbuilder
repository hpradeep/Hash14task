json.array!(@timesheets) do |timesheet|
  json.extract! timesheet, :id, :project_id, :description, :hours
  json.url timesheet_url(timesheet, format: :json)
end
