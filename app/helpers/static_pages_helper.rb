module StaticPagesHelper
  def set_student_group_cookie(id)
    if StudentGroup.where(id:id).count > 0
      cookies[:selected_student_group_id] = id
    else
      cookies.delete(:selected_student_group_id)
    end
  end
  

end
