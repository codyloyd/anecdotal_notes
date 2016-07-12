class CreateStudentNotes < ActiveRecord::Migration[5.0]
  def change
    create_table :student_notes do |t|
      t.integer :student_id
      t.integer :teacher_id
      t.text :content

      t.timestamps
    end
  end
end
