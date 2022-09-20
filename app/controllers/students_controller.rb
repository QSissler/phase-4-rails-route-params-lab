class StudentsController < ApplicationController

  # def index
  #   students = if params[:name]
  #                Student.by_name(params[:name])
  #              else
  #                Student.all
  #              end    
  #   render json: students
  # end

  def index
    if params[:name]
      students = Student.select{|student| student.first_name.downcase == params[:name] || student.last_name.downcase == params[:name]}
    else
      students = Student.all
    end
    render json: students
  end

  def show
    student = Student.find(params[:id])
    render json: student
  end

end

