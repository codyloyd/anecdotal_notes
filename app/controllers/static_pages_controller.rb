class StaticPagesController < ApplicationController
  def home
    @note = StudentNote.new
    @title = "Anecdotal Notes"
  end
end
