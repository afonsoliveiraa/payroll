class Event < ApplicationRecord
    has_many :notes, dependent: :destroy
    has_many :financials, dependent: :destroy
end
