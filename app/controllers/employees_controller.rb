class EmployeesController < ApplicationController
  before_action :set_employee, only: %i[ show edit update destroy ]

  # GET /employees or /employees.json
  def index
    @pagy, @employees = pagy(Employee.all)
  end

  # GET /employees/1 or /employees/1.json
  def show
    @notes = @employee.notes
    @financials = @employee.financials
  end

  # GET /employees/new
  def new
    @employee = Employee.new
  end

  # GET /employees/1/edit
  def edit
  end

  # POST /employees or /employees.json
  def create
    @employee = Employee.new(employee_params)

    respond_to do |format|
      if @employee.save
        flash.now[:notice] = "Employee was successfully created."
        format.turbo_stream
        format.html { redirect_to employee_url(@employee) }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /employees/1 or /employees/1.json
  def update
    respond_to do |format|
      if @employee.update(employee_params)
        flash.now[:notice] = "Employee was successfully updated."
        format.html { redirect_to employee_url(@employee) }
        format.turbo_stream
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employees/1 or /employees/1.json
  def destroy
    @employee.destroy

    respond_to do |format|
      flash.now[:notice] = "Employee was successfully destroyed."
      format.html { redirect_to employees_url }
      format.turbo_stream
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employee
      @employee = Employee.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def employee_params
      params.require(:employee).permit(:name, :cpf, :date_of_birth, :avatar, :admission_date, :termination, :role_id, :department_id, :sector_id, :address, :phone, :pension, :nature_id, :situation_id)
    end
end
