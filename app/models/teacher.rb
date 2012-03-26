class Teacher < ActiveRecord::Base
  has_many :teacher_instruments
  has_many :instruments, :through => :teacher_instruments
  has_many :teacher_availability
  has_many :preferred_teachers

  validates :family_name, presence: true
  validates :first_name, presence: true
end
