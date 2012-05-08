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

  validates_length_of :phone_number1, :minimum => 10, :maximum => 11, :allow_blank => true
  validates_length_of :phone_number2, :minimum => 10, :maximum => 11, :allow_blank => true
  validates_length_of :phone_number3, :minimum => 10, :maximum => 11, :allow_blank => true

  def status_text
     self.status == 1 ? "Active": "Inactive"
  end

  def full_name
    self.first_name + " " + self.family_name
  end

  protected

  def strip_phone_numbers
    self.phone_number1 = self.phone_number1.gsub(/[^0-9]/, "")
    self.phone_number2 = self.phone_number2.gsub(/[^0-9]/, "")
    self.phone_number3 = self.phone_number3.gsub(/[^0-9]/, "")
  end
end
