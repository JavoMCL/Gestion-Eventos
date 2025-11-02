class ReportsController < ApplicationController
  def index
    # Datos generales
    @total_clients = Client.count
    @total_events = Event.count
    @total_contracts = Contract.count
    @total_employees = Employee.count
    @total_assignments = Assignment.count

    # Datos específicos
    @active_contracts = Contract.where(state: 'Activo').count
    @completed_events = Event.where(event_type: 'Finalizado').count rescue 0

    # Distribución de personal
    @assigned_employees = Assignment.select(:employee_id).distinct.count
    @unassigned_employees = @total_employees - @assigned_employees
  end
end
