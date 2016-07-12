class StudentsController < ApplicationController
  def show
    @student = Student.find(params[:id])
    @notes = @student.notes.all
    @title = @student.name
  end
end
