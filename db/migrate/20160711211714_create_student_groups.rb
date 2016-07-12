class CreateStudentGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :student_groups do |t|
      t.string :name
      t.integer :teacher_id

      t.timestamps
    end
  end
end
