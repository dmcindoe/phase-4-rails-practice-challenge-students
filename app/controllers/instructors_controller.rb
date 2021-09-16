class InstructorsController < ApplicationController
  wrap_parameters format: []
  
    def index
    instructors = Instructor.all 
      render json: instructors
    end
  
    def show
      instructor = find_student
      if instructor
        render json: instructor
      else
        render json: { error: "Instructor not found" }, status: :not_found
      end
    end
  
    def create
      instructor = Instructor.create!(instructor_params)
      render json: instructor, status: :created
    end
  
    def update
      instructor = find_instructor
      instructor.update(instructor_params)
      render json: instructor, status: :accepted
    end
  
    def destroy
      instructor = find_instructor
        if instructor
          instructor.destroy
          head :no_content
        else
          render json: { error: "Instructor not found" }, status: not_found
      end 
    end
  
  private
  
    def find_instructor
      Instructor.find_by(id: params[:id])
    end
  
    def instructor_params
      params.permit(:name)
    end
  
  end