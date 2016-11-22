class DepartmentsController < ApplicationController

  before_filter :authorize

  def index
    @departments = Department.all
  end

  def show
  end

  def new
  end

  def create
    department = Department.new(message_params)
    if department.save
      flash[:success] = "New department "+department.department_name+" saved"
      redirect_to departments_path
    else
      render departments_new_path
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def message_params
    params.require(:department).permit(:department_code, :department_name, :description)
  end
end
