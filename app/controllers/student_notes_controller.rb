class StudentNotesController < ApplicationController
  before_action :authenticate_user!
  def create
    note = current_user.student_notes.new
    note.student_id = params[:student_note][:student_id].to_i
    note.content = params[:student_note][:content]
    note.context_list.add params[:student_note][:tag_list], parse: true
    if note.save
      flash[:success] = "note created!"
      redirect_to root_url
    else
      flash[:danger] = note.errors.full_messages.to_sentence
      redirect_to root_url
    end
  end

  def edit
    @title = "Edit Note"
    @note = StudentNote.find(params[:id])
    authorize! :read, @note
  end

  def update
    note = StudentNote.find(params[:id])
    note.update_attributes(content: params[:student_note][:content])
    note.context_list= (params[:student_note][:tag_list])
    note.save
    redirect_to note.student
  end
  def destroy
    note = StudentNote.find(params[:id])
    note.delete
    redirect_to note.student
  end
end
