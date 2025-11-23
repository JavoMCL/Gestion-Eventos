class EmployeesController < ApplicationController
  before_action :set_employee, only: [:edit, :update, :destroy]

  def index
    @employees = Employee.all

    if params[:search].present?
      search_term = "%#{params[:search]}%"
      @employees = @employees.where(
        "name ILIKE ? OR email ILIKE ? OR position ILIKE ?",
        search_term, search_term, search_term
      )
    end
    @employees = @employees.page(params[:page]).per(5)
  end

  def new
    @employee = Employee.new
  end

  def create
    @employee = Employee.new(employee_params)
    if @employee.save
      redirect_to employees_path, notice: "Empleado creado exitosamente."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @employee.update(employee_params)
      redirect_to employees_path, notice: "Empleado actualizado correctamente."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @employee.destroy
    redirect_to employees_path, notice: "Empleado eliminado correctamente."
  end

  private

  def set_employee
    @employee = Employee.find(params[:id])
  end

  def employee_params
    params.require(:employee).permit(:name, :position, :phone_number, :email, :active)
  end
end
