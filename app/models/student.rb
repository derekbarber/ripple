class Student < ActiveRecord::Base
  #attr_accessible :family_id, :first_name, :family_name, :birthday, :gender, :custom_contact_details
  #attr_accessible :street_address, :city, :postal_code, :phone_number1, :phone_number2, :phone_number3
  #attr_accessible :phone_number4, :primary_email, :secondary_email, :notes, :assessment_form, :bank_authorization, :status
  belongs_to :family
  has_many :student_instrument, :dependent => :destroy
  has_many :student_availability, :dependent => :destroy
  has_many :lessons, :dependent => :destroy

  valid_email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :primary_email, format: { with: valid_email_regex }, :allow_blank => true,
                    uniqueness: { case_sensitive: false }
  validates :secondary_email, format: { with: valid_email_regex }, :allow_blank => true,
                    uniqueness: { case_sensitive: false }

  validates_length_of :phone_number1, :minimum => 10, :maximum => 11, :allow_blank => true
  validates_length_of :phone_number2, :minimum => 10, :maximum => 11, :allow_blank => true
  validates_length_of :phone_number3, :minimum => 10, :maximum => 11, :allow_blank => true
  validates_length_of :phone_number4, :minimum => 10, :maximum => 11, :allow_blank => true

  mount_uploader :assessment_form, AssessmentUploader
  mount_uploader :bank_authorization, BankAuthorizationUploader

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

  def age
    now = Time.now.utc.to_date
    now.year - self.birthday.year - (self.birthday.to_date.change(:year => now.year) > now ? 1 : 0)
  end

  protected

  def strip_phone_numbers
    self.phone_number1 = self.phone_number1.gsub(/[^0-9]/, "")
    self.phone_number2 = self.phone_number2.gsub(/[^0-9]/, "")
    self.phone_number3 = self.phone_number3.gsub(/[^0-9]/, "")
    self.phone_number4 = self.phone_number4.gsub(/[^0-9]/, "")
  end

end
