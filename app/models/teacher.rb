class Teacher < ApplicationRecord
  has_many :teacher_relationship
  has_many :students, through: :teacher_relationship, source: :student
  has_many :courses
end
