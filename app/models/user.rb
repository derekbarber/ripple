# == Schema Information
#
# Table name: users
#
#  id               :integer         not null, primary key
#  username         :string(255)
#  password_digest  :string(255)
#  created_at       :datetime        not null
#  updated_at       :datetime        not null
#

class User < ActiveRecord::Base
  attr_accessible :username, :password, :password_confirmation, :admin, :teacher_id, :status
  has_secure_password
  #before_save :create_remember_token

  validates :username, presence: true, length: { maximum: 50 }
  validates :password, length: { minimum: 6 }

  private

    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end
end
