class StudentNote < ApplicationRecord
  belongs_to :student
  belongs_to :teacher, class_name: "User"
  validates :content, presence: true
end
