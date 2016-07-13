class StaticPagesController < ApplicationController
  def home
    @note = StudentNote.new
    @title = "Anecdotal Notes"
    @student_groups = current_user.student_groups
  end
end
