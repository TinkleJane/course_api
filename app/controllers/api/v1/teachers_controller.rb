class Api::V1::TeachersController < ApiController
  def index
    @teachers = Teacher.all
    render json: @teachers.to_json(include: :courses)
  end

  def destory
    @teacher = Teacher.find(params[:id])
    @teacher.destroy
  end
end
