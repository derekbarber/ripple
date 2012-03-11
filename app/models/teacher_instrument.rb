class TeacherInstrument < ActiveRecord::Base
  belongs_to :teacher
  belongs_to :instrument
end
