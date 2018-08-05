class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :contacts , dependent: :destroy
  # devise :database_authenticatable, :authentication_keys => [:user_name,:mobile]

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         validates_presence_of :user_name,:email,:mobile
	     validates_numericality_of :mobile
	     validates_length_of :mobile, is: 10
	     validates :email, uniqueness: true
         validates :user_name, uniqueness: true
  
end
