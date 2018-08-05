class Category < ApplicationRecord
	has_many :contacts, dependent: :destroy
	validates_presence_of :name
	validates_uniqueness_of :name
	def contacts_list(current_user)
		list = []
		self.contacts.each do |contact|
			if (contact.user_id == current_user.id)
				list.push(contact)
			end
		end
		list
	end
end
