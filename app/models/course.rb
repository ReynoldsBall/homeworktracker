RawBlameHistory   
class Course < ActiveRecord::Base
  has_many :cohorts
  has_many :locations, through: :cohorts
  validates :title, uniqueness: true
  validates :description, presence: true
end