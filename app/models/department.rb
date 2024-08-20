class Department < ApplicationRecord
    has_many :sectors, dependent: :destroy
end
