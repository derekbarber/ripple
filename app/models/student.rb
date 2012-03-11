class Student < ActiveRecord::Base
  belongs_to :family
  has_many :student_instrument
end
