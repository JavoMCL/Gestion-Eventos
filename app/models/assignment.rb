class Assignment < ApplicationRecord
  belongs_to :event
  belongs_to :employee

  before_validation :assign_state_automatically

  validates :role, :state, presence: true
  validates :state, inclusion: { in: ['Planificada', 'En Proceso', 'Finalizada'] }

  private

  def assign_state_automatically
    return unless event.present?

    start = event.start_date
    finish = event.end_date
    today = Date.today

    self.state =
      if today < start
        "Planificada"
      elsif today >= start && today <= finish
        "En Proceso"
      else
        "Finalizada"
      end
  end
end

