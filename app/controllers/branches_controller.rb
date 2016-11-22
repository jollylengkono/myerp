class BranchesController < ApplicationController

  before_filter: authorize

  def index
    @branches = Branch.all
  end

  def show
  end

  def new
  end

  def create
    branch = Branch.new(message_params)
    if branch.save
      flash[:success] = "New branch: "+branch.branch_code+" saved"
      redirect_to branches_path
    else
      render branches_new_path
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
    params.require(:branch).permit(:branch_code, :address, :city, :phone_number)
  end
end
