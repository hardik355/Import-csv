class EmployeesController < ApplicationController
  
  def index
    @employees = Employee.all
    respond_to do |format|
      format.html
      format.csv { send_data @employees.to_csv}
    end
  end

  def import
    Employee.import(params[:file])
    redirect_to root_url, notice: "Product imported."
  end

  def show
    @employee = Employee.find(params[:id])
    #byebug
  end

  def edit
    @employee = Employee.find(params[:id])
  end

  def new
    @employee = Employee.new
  end

  def create
    @employee = Employee.new(employee_params)
    @employee.save
    redirect_to @employee
  end

  def update
    @employee = Employee.find(params[:id])
    @employee.update(employee_params)
    redirect_to @employee
  end

  def destroy
    @employee = Employee.find(params[:id])
    @employee.destroy
    redirect_to @employee
  end

  private 
  def employee_params
    params.require(:employee).permit(:name, :area, :city)  
  end

end