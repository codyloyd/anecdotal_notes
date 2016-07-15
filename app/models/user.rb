class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :student_groups, foreign_key: "teacher_id"
  has_many :students, through: :student_groups
  has_many :student_notes, foreign_key: "teacher_id"
  validates :email, :password, :name, presence: true
end
