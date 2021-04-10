class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # PASSWORD_FORMAT = /(?=.{8,})(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[[:^alnum:]])/
  PASSWORD_FORMAT = /\A(?=.*[a-z])(?=.*[A-Z])(?=.*[\W])(?=.*[\d])[\S]{8,15}\z/

  validates :password, 
    presence: true, 
    length: { in: Devise.password_length }, 
    format: { with: PASSWORD_FORMAT, message: 'should contain uppercase, lowercase, number and special character. Between 8 and 15 characters long'  }, 
    confirmation: true, 
    on: :create 

  validates :password, 
    allow_nil: true, 
    length: { in: Devise.password_length }, 
    format: { with: PASSWORD_FORMAT, message: 'should contain uppercase, lowercase, number and special character. Between 8 and 15 characters long'  }, 
    confirmation: true, 
    on: :update

  validates_presence_of :first_name, :last_name

  has_many :shifts, dependent: :destroy
  has_many :teams, through: :shifts, dependent: :destroy

  def fullname
    return self.first_name.to_s + ' ' + self.last_name.to_s 
  end

end
