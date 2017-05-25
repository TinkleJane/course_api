class Api::V1::StudentsController < ApiController
  def show
    @student = Student.find(params[:id])
    render json: @student
  end
end
