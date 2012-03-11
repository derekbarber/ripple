class StudentInstrument < ActiveRecord::Base
  belongs_to :student
  belongs_to :instrument
end
