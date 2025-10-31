class Contract < ApplicationRecord
  belongs_to :event

  validates :contract_number, presence: true, uniqueness: true
  validates :amount, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true
  validates :state, inclusion: { in: ['Activo', 'Cancelado', 'Completado'] }
end

