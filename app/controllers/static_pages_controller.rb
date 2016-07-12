class StaticPagesController < ApplicationController
  def home
    @note = StudentNote.new
  end
end
