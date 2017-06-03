class Api::V1::StudentsController < ApiController
  def show
    @student = Student.find(params[:id])
    render json: @student
  end

  def select_course
    if params[:course_id].present? && params[:student_id].present?
      select_count = CourseRelationship.where(["course_id = ? and student_id = ?", params[:course_id], params[:student_id]]).count
      if select_count > 0
        render json: { message: "该学生已选过该课程" }
      else
      @course = Course.find(params[:course_id])
      students_count = @course.course_relationships_count
      if students_count == 50
        @message = "课程#{@course.name} 人数已满"
        render json: { message: @message }
      else
        @courseselect = CourseRelationship.create!(student_id: params[:student_id], course_id: params[:course_id])
        render json: @courseselect
      end
    end
    end
  end
end
