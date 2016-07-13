class StaticPagesController < ApplicationController
  def home
    @note = StudentNote.new
    @title = "Anecdotal Notes"
    @student_groups = current_user.student_groups if user_signed_in?
    if params[:student_group]
      set_student_group_cookie(params[:student_group])
      redirect_to root_url
    end
  end

  def set_student_group_cookie(id)
    cookies[:selected_student_group_id] = id
  end
end
