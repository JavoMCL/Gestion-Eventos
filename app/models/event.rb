class Event < ApplicationRecord
    belongs_to :client
    validates :name, :event_type, :start_date, :client_id, presence: true
    has_many :contract, dependent: :destroy


    after_initialize :set_default_state, if: :new_record?
    private

    def set_default_state
      self.state ||= 'planificado'
    end
  end

