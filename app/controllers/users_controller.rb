class UsersController < ApplicationController
  before_action :authenticate_user!
  def show
    @user = current_user
    @student_groups = @user.student_groups.all
    @title = "Profile For #{@user.name}"
    @new_student_group = StudentGroup.new
  end
end
