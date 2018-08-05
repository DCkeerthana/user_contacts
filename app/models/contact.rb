class Contact < ApplicationRecord
	belongs_to :category
	belongs_to :user 
	validates_presence_of :name,:email,:mobile
	validates_numericality_of :mobile
	validates_length_of :mobile, is: 10
end
