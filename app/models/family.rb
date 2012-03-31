class Family < ActiveRecord::Base
  has_many :students

  before_validation :strip_phone_numbers

  validates :family_name, presence: true
  validates :parent_name, presence: true

  valid_email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :primary_email, format: { with: valid_email_regex }, :allow_blank => true,
                    uniqueness: { case_sensitive: false }
  validates :secondary_email, format: { with: valid_email_regex }, :allow_blank => true,
                    uniqueness: { case_sensitive: false }

  validates_length_of :home_phone, :minimum => 10, :maximum => 10, :allow_blank => true
  validates_length_of :mobile_phone, :minimum => 10, :maximum => 10, :allow_blank => true

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

  protected

  def strip_phone_numbers
    self.home_phone = self.home_phone.gsub(/[^0-9]/, "")
    self.mobile_phone = self.home_phone.gsub(/[^0-9]/, "")
  end

end
