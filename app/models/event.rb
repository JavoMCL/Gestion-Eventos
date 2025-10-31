class Event < ApplicationRecord
    belongs_to :client
    validates :name, :event_type, :start_date, :client_id, presence: true
    has_many :contract, dependent: :destroy
  end

