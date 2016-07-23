class StudentsController < ApplicationController
  before_action :authenticate_user!

  def show
    @student = Student.find(params[:id])
    @notes = @student.notes.all.order(created_at: "desc")
    @notes = @notes.tagged_with(params[:tag]) if params[:tag].present?
    @notes = @notes.after_date(Time.strptime(params[:date][:start_date], "%m/%d/%Y")) if params[:date] && params[:date][:start_date].length > 0
    @notes = @notes.before_date(Time.strptime(params[:date][:end_date], "%m/%d/%Y"))if params[:date] && params[:date][:end_date].length > 0
    @title = @student.name
    @context_list = create_context_list
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "report", layout: 'pdf.html.erb', page_size: "letter"
      end
    end
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
    list = [""]
    @student.notes.each { |note| note.context_list.each {|tag| list << tag }}
    list.uniq
  end
end
