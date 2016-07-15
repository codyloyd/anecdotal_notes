class StudentGroup < ApplicationRecord
  belongs_to :teacher, class_name: "User", foreign_key: "teacher_id"
  has_many :students
  validates :name, presence: true
end
