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

  def self.csv_header
    "First Name,Last Name,Email,Phone,Mobile, Address, FAX, City".split(',')
  end

  def self.build_from_csv(row, status)
    family = Family.new

    secondary_email = row[2]
    if secondary_email == nil
      secondary_email = ''
    end

    phone_number1 = row[12]
    if phone_number1 == nil
      phone_number1 = ''
    end
    
    phone_number2 = row[13]
    if phone_number2 == nil
      phone_number2 = ''
    end

    family.attributes ={:city => row[0],
      :primary_email => row[1],
      :secondary_email => secondary_email,
      :third_email => row[3],
      :parent_names => row[4],
      :family_name => row[5],
      :notes => row[11],
      :phone_number1 => phone_number1,
      :phone_number2 => phone_number2,
      :street_address => row[14],
      :postal_code => row[15],
      :phone_number3 => '',
      :phone_number4 => '',
      :status => status}
    return family
  end

  def to_csv
    [family_name, parent_names, email, phone, mobile, address, fax, city]
  end

  protected

  def strip_phone_numbers
    self.phone_number1 = self.phone_number1.gsub(/[^0-9]/, "")
    self.phone_number2 = self.phone_number2.gsub(/[^0-9]/, "")
    self.phone_number3 = self.phone_number3.gsub(/[^0-9]/, "")
    self.phone_number4 = self.phone_number4.gsub(/[^0-9]/, "")
  end

end
