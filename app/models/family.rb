class Family < ActiveRecord::Base
  has_many :students

  before_validation :strip_phone_numbers

  validates :family_name, presence: true
  validates :parent_names, presence: true

  valid_email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :primary_email, format: { with: valid_email_regex }, :allow_blank => true,
                    uniqueness: { case_sensitive: false }
  validates :secondary_email, format: { with: valid_email_regex }, :allow_blank => true,
                    uniqueness: { case_sensitive: false }

  validates_length_of :phone_number1, :minimum => 10, :maximum => 11, :allow_blank => true
  validates_length_of :phone_number2, :minimum => 10, :maximum => 11, :allow_blank => true
  validates_length_of :phone_number3, :minimum => 10, :maximum => 11, :allow_blank => true
  validates_length_of :phone_number4, :minimum => 10, :maximum => 11, :allow_blank => true

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
    self.phone_number1 = self.phone_number1.gsub(/[^0-9]/, "")
    self.phone_number2 = self.phone_number2.gsub(/[^0-9]/, "")
    self.phone_number3 = self.phone_number3.gsub(/[^0-9]/, "")
    self.phone_number4 = self.phone_number4.gsub(/[^0-9]/, "")
  end

end
