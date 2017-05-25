class Api::V1::TeachersController < ApiController
  def index
    @teachers = Teacher.all
    render json: @teachers, each_serializer: TeacherSerializer
  end

  def destory
    @teacher = Teacher.find(params[:id])
    @message = "删除teacher:#{@teacher.id} 与其所带课程的全部信息"
    @teacher.destroy
    render json: { message: @message }
  end
end
