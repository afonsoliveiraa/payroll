class SectorsController < ApplicationController
  before_action :set_department
  before_action :set_sector, only: %i[ show edit update destroy ]

  # GET /sectors or /sectors.json
  def index
    @sectors = Sector.all
  end

  # GET /sectors/1 or /sectors/1.json
  def show
  end

  # GET /sectors/new
  def new
    @sector = Sector.new
  end

  # GET /sectors/1/edit
  def edit
  end

  # POST /sectors or /sectors.json
  def create
    @sector = Sector.new(sector_params)

    respond_to do |format|
      if @sector.save
        flash.now[:notice] = "Sector was successfully created."
        format.turbo_stream
        format.html { redirect_to sector_url(@sector) }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @sector.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sectors/1 or /sectors/1.json
  def update
    respond_to do |format|
      if @sector.update(sector_params)
        flash.now[:notice] = "Sector was successfully updated."  
        format.html { redirect_to sector_url(@sector) }
        format.turbo_stream
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @sector.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sectors/1 or /sectors/1.json
  def destroy
    @sector.destroy

    respond_to do |format|
      flash.now[:notice] = "Sector was successfully destroyed."
      format.html { redirect_to sectors_url }
      format.turbo_stream
    end
  end

  private
    def set_department
      @department = Department.find(params[:department_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_sector
      @sector = Sector.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def sector_params
      params.require(:sector).permit(:description, :department_id)
    end
end
