class AssignmentsController < ApplicationController
  before_action :set_assignment, only: [:edit, :update, :destroy]

  def index
    @assignments = Assignment.includes(:event, :employee).all

    if params[:search].present?
      search_term = "%#{params[:search]}%"
      @assignments = @assignments.where(
        "role ILIKE ? OR task ILIKE ? OR state ILIKE ?",
        search_term, search_term, search_term
      )
    end
    @assignments = @assignments.page(params[:page]).per(10)
  end

  def new
    @assignment = Assignment.new
  end

  def create
    @assignment = Assignment.new(assignment_params)
    if @assignment.save
      redirect_to assignments_path, notice: "Asignación creada correctamente."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @assignment.update(assignment_params)
      redirect_to assignments_path, notice: "Asignación actualizada correctamente."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @assignment.destroy
    redirect_to assignments_path, notice: "Asignación eliminada correctamente."
  end

  private

  def set_assignment
    @assignment = Assignment.find(params[:id])
  end

  def assignment_params
    params.require(:assignment).permit(:event_id, :employee_id, :role, :task, :state)
  end
end

