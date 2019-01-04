class Cohort < ApplicationRecord
  has_many :users
  has_many :courses
  belongs_to :user, optional: true
end
