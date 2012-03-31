class Lesson < ActiveRecord::Base
  belongs_to :student
  belongs_to :instrument
  belongs_to :teacher
  has_many :student_instrument
end
