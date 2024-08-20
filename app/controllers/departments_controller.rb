class DepartmentsController < ApplicationController
  before_action :set_department, only: %i[ show edit update destroy ]

  # GET /departments or /departments.json
  def index
    @pagy, @departments = pagy(Department.all)
  end

  # GET /departments/1 or /departments/1.json
  def show
    @sectors = @department.sectors
  end

  # GET /departments/new
  def new
    @department = Department.new
  end

  # GET /departments/1/edit
  def edit
  end

  # POST /departments or /departments.json
  def create
    @department = Department.new(department_params)

    respond_to do |format|
      if @department.save
        flash.now[:notice] = "Department was successfully created."
        format.turbo_stream
        format.html { redirect_to department_url(@department) }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @department.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /departments/1 or /departments/1.json
  def update
    respond_to do |format|
      if @department.update(department_params)
        flash.now[:notice] = "Department was successfully updated."
        format.html { redirect_to department_url(@department) }
        format.turbo_stream
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @department.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /departments/1 or /departments/1.json
  def destroy
    @department.destroy

    respond_to do |format|
      flash.now[:notice] = "Department was successfully destroyed." 
      format.html { redirect_to departments_url }
      format.turbo_stream
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_department
      @department = Department.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def department_params
      params.require(:department).permit(:description, :address, :phone)
    end
end
