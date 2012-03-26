class StudentInstrument < ActiveRecord::Base
  belongs_to :student
  belongs_to :instrument
  has_many :preferred_teachers, :dependent => :destroy
end
