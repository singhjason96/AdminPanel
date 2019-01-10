class Cohort < ApplicationRecord
  has_many :students, dependent: :destroy
  has_many :courses, dependent: :destroy
  has_one :instructor, dependent: :destroy
end
