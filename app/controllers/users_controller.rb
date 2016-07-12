class UsersController < ApplicationController
  def show
    @user = current_user
    @student_groups = @user.student_groups.all
  end
end
