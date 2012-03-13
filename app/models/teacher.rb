class Teacher < ActiveRecord::Base
  has_many :teacher_instrument
  has_many :teacher_availability
end
