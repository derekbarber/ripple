class Student < ActiveRecord::Base
  belongs_to :family
  has_many :student_instrument, :dependent => :destroy
  has_many :student_availability, :dependent => :destroy
  has_many :lessons, :dependent => :destroy

  valid_email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :primary_email, format: { with: valid_email_regex }, :allow_blank => true,
                    uniqueness: { case_sensitive: false }
  validates :secondary_email, format: { with: valid_email_regex }, :allow_blank => true,
                    uniqueness: { case_sensitive: false }

  validates_length_of :home_phone, :minimum => 10, :maximum => 10, :allow_blank => true
  validates_length_of :mobile_phone, :minimum => 10, :maximum => 10, :allow_blank => true

  def status_text
    if self.family_id && self.family_id > 0
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

  def full_name
    self.first_name + " " + self.family_name
  end

  protected

  def strip_phone_numbers
    self.home_phone = self.home_phone.gsub(/[^0-9]/, "")
    self.mobile_phone = self.home_phone.gsub(/[^0-9]/, "")
  end

end
