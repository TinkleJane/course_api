class CourseRelationshipSerializer < ActiveModel::Serializer
  attributes :id, :course, :student

  def course
    CourseSerializer.new(object.course).attributes
  end

  def student
    StudentSerializer.new(object.student).attributes
  end
end
