class StudentsController < ApplicationController
  before_action :authenticate_user!

  def show
    @student = Student.find(params[:id])
    if params[:tag]
      @notes = @student.notes.tagged_with(params[:tag])
    else
      @notes = @student.notes.all.order(created_at: "desc")
    end
    @title = @student.name
    @context_list = create_context_list
    authorize! :read, @student
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

  def edit
  end
  def update
  end

  def destroy
    student = Student.find(params[:id])
    student.destroy
    redirect_to student.student_group
  end


  private

  def create_context_list
    list = []
    @student.notes.each { |note| note.context_list.each {|tag| list << tag }}
    list.uniq
  end
end
