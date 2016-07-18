class StaticPagesController < ApplicationController
  def home
    @note = StudentNote.new
    @title = "Anecdotal Notes"
    @selected_class = StudentGroup.find(cookies[:selected_student_group_id]) if cookies[:selected_student_group_id]
    @student_groups = current_user.student_groups if user_signed_in?
    if params[:student_group]
      set_student_group_cookie(params[:student_group])
      redirect_to root_url
    end
  end

  def help
    @title = "FAQ/Help"
  end

  def set_student_group_cookie(id)
    if StudentGroup.where(id:id).count > 0
      cookies[:selected_student_group_id] = id
    else
      cookies.delete(:selected_student_group_id)
    end
  end
end
