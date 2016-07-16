class StudentsController < ApplicationController
  def show
    @student = Student.find(params[:id])
    if params[:tag]
      @notes = @student.notes.tagged_with(params[:tag])
    else
      @notes = @student.notes.all.order(created_at: "desc")
    end
    @title = @student.name
  end

  def create
    group = StudentGroup.find(params[:student][:student_group_id])
    student = group.students.new
    student.name = params[:student][:name]
    if student.save
      flash[:success] = "Student Added"
      redirect_to group
    else
      flash[:danger] = "Oops! try again!"
      redirect_to group
    end
  end
end
