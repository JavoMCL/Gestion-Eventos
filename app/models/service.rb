class Service < ApplicationRecord
  has_many :contract_details, dependent: :destroy
end
