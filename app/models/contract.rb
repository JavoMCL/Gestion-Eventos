class Contract < ApplicationRecord
  belongs_to :event
  has_many :contract_details, dependent: :destroy
  accepts_nested_attributes_for :contract_details, allow_destroy: true,
                                reject_if: proc { |attrs| attrs['service_id'].blank? }


  validates :contract_number, presence: true, uniqueness: true
  validates :amount, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true
  validates :state, inclusion: { in: ['Activo', 'Cancelado', 'Completado'] }
end

