class Student < ApplicationRecord
  has_many :course_relationship
  has_many :courses, through: :course_relationship, source: :course
end
