class Assignment < ApplicationRecord
  belongs_to :event
  belongs_to :employee

  validates :role, :state, presence: true
  validates :state, inclusion: { in: ['Planificada', 'En Proceso', 'Finalizada'] }
end
