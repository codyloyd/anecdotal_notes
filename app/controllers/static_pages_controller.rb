class StaticPagesController < ApplicationController
  def home
    @note = StudentNote.new
    @title = "Anecdotal Notes"
    @student_groups = current_user.student_groups
    if params[:id]
      select_student_group(params[:id])
    end
  end

  def select_student_group(id)
    set_student_group_cookie(id)
    render :home
  end
end
