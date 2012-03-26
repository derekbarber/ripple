class Family < ActiveRecord::Base
  has_many :students

  def status_text
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
