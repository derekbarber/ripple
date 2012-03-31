class Teacher < ActiveRecord::Base
  has_many :teacher_instruments
  has_many :instruments, :through => :teacher_instruments
  has_many :teacher_availability
  has_many :preferred_teachers

  before_validation :strip_phone_numbers

  validates :family_name, presence: true
  validates :first_name, presence: true

  valid_email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: valid_email_regex },
                    uniqueness: { case_sensitive: false }
  validates :secondary_email, format: { with: valid_email_regex },
                    uniqueness: { case_sensitive: false }

  validates_length_of :home_phone, :minimum => 10, :maximum => 10, :allow_blank => true
  validates_length_of :mobile_phone, :minimum => 10, :maximum => 10, :allow_blank => true

  protected

  def strip_phone_numbers
    self.home_phone = self.home_phone.gsub(/[^0-9]/, "")
    self.mobile_phone = self.home_phone.gsub(/[^0-9]/, "")
  end
end
