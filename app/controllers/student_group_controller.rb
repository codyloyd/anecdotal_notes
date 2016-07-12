class StudentGroupController < ApplicationController
  def show
    @student_group = StudentGroup.find(params[:id])
    @students = @student_group.students.all
  end
end
