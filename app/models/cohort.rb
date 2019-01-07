class Cohort < ApplicationRecord
  has_many :students
  has_many :courses
  has_one :instructor
end
