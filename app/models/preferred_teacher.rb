class PreferredTeacher < ActiveRecord::Base
  belongs_to :student_instrument
  belongs_to :teacher
end
