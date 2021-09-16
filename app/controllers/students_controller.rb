class StudentsController < ApplicationController
  wrap_parameters format: []
  
  def index
    students = Student.all 
    render json: students
  end

  def show
    student = find_student
    if student
      render json: student
    else
      render json: { error: "Student not found" }, status: :not_found
    end
  end

  def create
    student = Student.create!(student_params)
    render json: student, status: :created
  end

  def update
    student = find_student
    student.update(student_params)
    render json: student, status: :accepted
  end

  def destroy
    student = find_student
      if student
        student.destroy
        head :no_content
      else
        render json: { error: "Student not found" }, status: not_found
    end 
  end

private

  def find_student
    Student.find_by(id: params[:id])
  end

  def student_params
    params.permit(:name, :age, :major, :instructor_id)
  end

end