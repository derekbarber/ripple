class Lesson < ActiveRecord::Base
  belongs_to :student
  belongs_to :instrument
  belongs_to :teacher
  has_many :student_instrument

  def status_text
    if self.status == 0
      "Tenative"
    elsif self.status == 1
      "Confirmed"
    end
  end
end
