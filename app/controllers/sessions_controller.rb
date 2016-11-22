class SessionsController < ApplicationController
  # Render another layout for login page
  layout "login_layout"

  def new
  end

  def create
    employee = Employee.find_by(email_address: params[:session][:email].downcase)
    if employee && employee.authenticate(params[:session][:password])
      log_in employee
      redirect_to list_employee_path
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to login_path
  end
end
