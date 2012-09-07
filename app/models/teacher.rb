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
    if self.status == 0
      "Prospective"
    elsif self.status == 1
      "Active"
    elsif self.status == 2
      "Inactive"
    end

  end

  def full_name
    self.first_name + " " + self.family_name
  end

  def self.csv_header
    "First Name,Last Name,Email,Phone,Mobile, Address, FAX, City".split(',')
  end

  def self.build_from_csv(row, status)
    teacher = Teacher.new

    secondary_email = row[2]
    if secondary_email == nil
      secondary_email = ''
    end

    phone_number1 = row[7]
    if phone_number1 == nil
      phone_number1 = ''
    end

    phone_number2 = row[8]
    if phone_number2 == nil
      phone_number2 = ''
    end

    phone_number3 = row[9]
    if phone_number3 == nil
      phone_number3 = ''
    end

    teacher.attributes ={:city => row[0],
      :email => row[1],
      :secondary_email => secondary_email,
      :first_name => row[4],
      :family_name => row[5],
      :notes => row[6],
      :phone_number1 => phone_number1,
      :phone_number2 => phone_number2,
      :phone_number3 => phone_number3,
      :street_address => row[10],
      :postal_code => row[11],
      :status => status}
    return teacher
  end

  def to_csv
    [family_name, parent_names, email, phone, mobile, address, fax, city]
  end


  protected

  def strip_phone_numbers
    self.phone_number1 = self.phone_number1.gsub(/[^0-9]/, "")
    self.phone_number2 = self.phone_number2.gsub(/[^0-9]/, "")
    self.phone_number3 = self.phone_number3.gsub(/[^0-9]/, "")
  end
end
