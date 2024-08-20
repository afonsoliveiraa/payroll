class Employee < ApplicationRecord
  belongs_to :role
  belongs_to :department
  belongs_to :sector
  belongs_to :nature
  belongs_to :situation
  has_one_attached :avatar

  has_many :notes, dependent: :destroy
  has_many :financials, dependent: :destroy
end
