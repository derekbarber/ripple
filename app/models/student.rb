class Student < ActiveRecord::Base
  belongs_to :family
  has_many :student_instrument, :dependent => :destroy
  has_many :student_availability, :dependent => :destroy

  def status_text
    if self.family_id > 0
      if self.status == 0
        "Active"
      elsif self.status == 1
        "Inactive"
      end
    else
      if self.status == 0
        "Active Prospect"
      elsif self.status == 1
        "Customer"
      elsif self.status == 2
        "Nurture Prospect"
      elsif self.status == 3
        "Inactive Prospect"
      end
    end
  end
end
