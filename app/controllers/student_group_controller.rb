class StudentGroupController < ApplicationController
  before_action :authenticate_user!
  def show
    @student_group = StudentGroup.find(params[:id])
    @students = @student_group.students.all
    @title = @student_group.name
    @new_student = Student.new
    authorize! :read, @student_group
  end

  def new
    @student_group = StudentGroup.new
  end

  def create
    student_group = current_user.student_groups.new
    student_group.name = params[:student_group][:name]
    if student_group.save
      flash[:success] = "Class created!"
      redirect_to student_group
    else
    end
  end

end
