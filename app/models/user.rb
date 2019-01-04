class User < ApplicationRecord
  belongs_to :cohort, optional: true
end
