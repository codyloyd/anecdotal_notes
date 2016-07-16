class Student < ApplicationRecord
  belongs_to :student_group
  has_one :teacher, through: :student_group, class_name: "User"
  has_many :notes, class_name: "StudentNote"
  acts_as_tagger
  validates :name, presence: true
end
