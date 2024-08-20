class Financial < ApplicationRecord
  belongs_to :nature
  belongs_to :situation
  belongs_to :department
  belongs_to :sector
  belongs_to :employee
  belongs_to :role
  belongs_to :event
  belongs_to :competence
end
