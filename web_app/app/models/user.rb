# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  pin                    :integer
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime
#  updated_at             :datetime
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  #attr
  attr_accessor :login

  #relationships
  has_many :groups
  has_many :bookmarks
  has_many :urls, through: :bookmarks

  #make these messaging names less awwkward
  has_many :sent, class_name: "Message",
                        foreign_key: "send_to"

  has_many :sent_to_me, class_name: "Message",
                        foreign_key: "send_from"


  #validations
  validates :pin, length: {is: 4}, allow_blank: true
  validates :username, :uniqueness => {:case_sensitive => false}, format: { with: /\A[a-zA-Z0-9]+\Z/ }

  #before/after actions
  before_create :generate_access_token
  before_create :generate_uuid

  #check if they have typed in the correct pin code
  #check if user.groups has the group id
  def has_access(pin, group_id)
    if(pin.to_i == self.pin) and (self.groups.where(id: group_id).any?)
      return true
    else
      return false
    end
  end

  #authenticate user
  #api/v1/sessions
  def self.authenticate(email, password)
    user = User.find_by_email(email.to_s.downcase.strip) if email.present?

    if user
      # yanked from Devise
      # https://github.com/plataformatec/devise/blob/master/lib/devise/models/database_authenticatable.rb
      bcrypt = ::BCrypt::Password.new(user.encrypted_password)
      password = ::BCrypt::Engine.hash_secret(password, bcrypt.salt)
      user = nil unless User.secure_compare(password, user.encrypted_password)
    end

    user
  end

  # yanked from Devise
  # https://github.com/plataformatec/devise/blob/master/lib/devise.rb
  #api/v1/sessions
  def self.secure_compare(a, b)
    return false if a.blank? || b.blank? || a.bytesize != b.bytesize
    l = a.unpack "C#{a.bytesize}"

    res = 0
    b.each_byte { |byte| res |= byte ^ l.shift }
    res == 0
  end

  # Devise login for username or email
  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      where(conditions).first
    end
  end

  private
    #Rails Cast API Security
    def generate_access_token
      begin
        self.access_token = SecureRandom.hex
      end while self.class.exists?(access_token: self.access_token)
    end

    def generate_uuid
      begin
        self.uuid = SecureRandom.uuid
      end while self.class.exists?(uuid: self.uuid)
    end
end
