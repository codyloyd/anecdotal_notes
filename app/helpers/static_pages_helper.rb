module StaticPagesHelper
  def set_student_group_cookie(id)
    cookies[:selected_student_group_id] = id
  end

end
