class CourseSerializer < ActiveModel::Serializer
  attributes :id, :name, :teacher
  def teacher
    TeacherSerializer.new(object.teacher).attributes
  end
end
