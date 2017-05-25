class Course < ApplicationRecord
  has_many :course_relationship
  has_many :students, through: :course_relationship, source: :student
  belongs_to :teacher
end
