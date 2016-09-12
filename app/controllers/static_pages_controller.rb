class StaticPagesController < ApplicationController
  include StaticPagesHelper
  
  def home
    @note = StudentNote.new
    @title = "Anecdotal Notes"
    @selected_class = StudentGroup.find(cookies[:selected_student_group_id]) if  StudentGroup.where(id:cookies[:selected_student_group_id]).count > 0
    @student_groups = current_user.student_groups if user_signed_in?
    if params[:student_group]
      set_student_group_cookie(params[:student_group])
      redirect_to root_url
    end
  end

  def help
    @title = "FAQ/Help"
  end


end
