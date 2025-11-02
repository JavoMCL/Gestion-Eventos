class Employee < ApplicationRecord

  has_many :assignments, dependent: :destroy

  validates :name, :position, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, allow_blank: true
end
