class Teacher < ActiveRecord::Base
  has_many :teacher_instruments, :dependent => :destroy
  has_many :instruments, :through => :teacher_instruments
  has_many :teacher_availability, :dependent => :destroy
  has_many :preferred_teachers, :dependent => :destroy
  has_many :lessons, :dependent => :destroy

  before_validation :strip_phone_numbers

  validates :family_name, presence: true
  validates :first_name, presence: true

  valid_email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: valid_email_regex },
                    uniqueness: { case_sensitive: false }
  validates :secondary_email, format: { with: valid_email_regex },
                    uniqueness: { case_sensitive: false }, :allow_blank => true

  validates_length_of :home_phone, :minimum => 10, :maximum => 10, :allow_blank => true
  validates_length_of :mobile_phone, :minimum => 10, :maximum => 10, :allow_blank => true


  def status_text
     self.status == 1 ? "Active": "Inactive"
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
