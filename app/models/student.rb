class Student < ApplicationRecord
  has_many :teacher_relationship
  has_many :teachers, through: :teacher_relationship, source: :teachers

  has_many :course_relationship
  has_many :courses, through: :course_relationship, source: :course
end
