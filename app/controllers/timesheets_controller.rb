class TimesheetsController < ApplicationController
  before_action :set_timesheet, only: [:show, :edit, :update, :destroy]

  # GET /timesheets
  # GET /timesheets.json
  def index
    @timesheets = Timesheet.all
  end

  # GET /timesheets/1
  # GET /timesheets/1.json
  def show
    
  end

  # GET /timesheets/new
  def new
    @timesheet = Timesheet.new

  end

  # GET /timesheets/1/edit
  def edit
  render partial: 'timesheets/edit', locals: {timesheet: @timesheet}
  puts @timesheet.project.name
    #render :json => {result: render_to_string{partial: "timesheets/form",locals:  {}}}
  end
  def sample
  
  end

  # POST /timesheets
  # POST /timesheets.json
  def create

      params[:timesheet].each do |key,value|
      Timesheet.create(:project_id => value[:project_id],:description => value[:description],:hours => value[:hours])
       end
       redirect_to "/timesheets",notice: "Timesheet created successfully" 
  end     

   
  def update
    respond_to do |format|
      if @timesheet.update(timesheet_params)
        format.html { redirect_to timesheets_path,notice: 'Timesheet was successfully updated.' }
        format.json { render :show, status: :ok, location: @timesheet }
     
      end
    end
  end

  # DELETE /timesheets/1
  # DELETE /timesheets/1.json
  def destroy
    @timesheet.destroy
    respond_to do |format|
      format.html { redirect_to timesheets_path, notice: 'Timesheet was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def newtimesheet
    render partial: 'timesheets/new_timesheet', locals: {index: params[:index]}
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_timesheet
      @timesheet = Timesheet.find(params[:id])
    end
    def timesheet_params
      params.require(:timesheet).permit(:project_id,:description,:hours)
    end
end