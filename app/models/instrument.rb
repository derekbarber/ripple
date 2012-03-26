class Instrument < ActiveRecord::Base
  has_many :student_instruments
  has_many :students, :through => :student_instruments
  has_many :teacher_instruments
  has_many :teachers, :through => :teacher_instruments
end
