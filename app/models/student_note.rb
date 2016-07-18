class StudentNote < ApplicationRecord
  belongs_to :student
  belongs_to :teacher, class_name: "User"
  acts_as_taggable
  acts_as_taggable_on :context
  validates :content, presence: true
  validates :student, presence: true
end
