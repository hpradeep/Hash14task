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
  end

  # POST /timesheets
  # POST /timesheets.json
  def create
    @timesheets = []
    params[:timesheet].each do |key, timesheet|
      @timesheets << Timesheet.create(timesheet.permit(:project_id, :description, :hours))
    end
    redirect_to timesheets_path, notice: 'Timesheets created successfully.'
  rescue => exception
    @exception = exception
    render :new
  end

  # PATCH/PUT /timesheets/1
  # PATCH/PUT /timesheets/1.json
  def update
    respond_to do |format|
      if @timesheet.update(timesheet_params)
        format.html { redirect_to @timesheet, notice: 'Timesheet was successfully updated.' }
        format.json { render :show, status: :ok, location: @timesheet }
      else
        format.html { render :edit }
        format.json { render json: @timesheet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /timesheets/1
  # DELETE /timesheets/1.json
  def destroy
    @timesheet.destroy
    respond_to do |format|
      format.html { redirect_to timesheets_url, notice: 'Timesheet was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_timesheet
      @timesheet = Timesheet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def timesheet_params
      params.require(:timesheet).permit(:project_id, :description, :hours)
    end
end
