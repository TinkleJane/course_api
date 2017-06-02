class Api::V1::StudentsController < ApiController
  def show
    @student = Student.find(params[:id])
    render json: @student
  end

  def select_course
    if params[:course_id].present? && params[:student_id].present?
      # course = Course.find(params[:id])
      @courseselect = CourseRelationship.create!(:student_id => params[:course_id], :course_id => params[:student_id])
      render json: @courseselect
    end
  end
end
