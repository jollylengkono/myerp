class EmployeesController < ApplicationController
  # Call authorization
  before_filter :authorize

  def index
    @employees = Employee.all
  end

  def show
  end

  def new
    @employee = Employee.new
  end

  def create
    @employee = Employee.new(message_params)
    if @employee.save
      flash[:success] = "New employee "+@employee.first_name+" "+@employee.last_name+" saved"
      redirect_to employees_path
    else
      render new_employee_path
    end
  end

  def edit
    @employee = Employee.find(params[:id])
  end

  def update
  end

  def destroy
    employee = Employee.find(params[:id])
    if employee.destroy
      flash[:success] = "Employee "+employee.first_name+" "+employee.last_name+" deleted"
      redirect_to employees_path
    end
  end

  private
  def message_params
    params.require(:employee).permit(:first_name, :last_name, :email_address, :password, :password_confirmation, :phone_number, :department_id, :branch_id)
  end

end
