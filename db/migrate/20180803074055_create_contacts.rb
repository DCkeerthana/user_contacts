class CreateContacts < ActiveRecord::Migration[5.1]
  def change
    create_table :contacts do |t|
    	t.string :name
    	t.string :email
    	t.string :mobile
    	t.integer :user_id
    	t.integer :category_id


      t.timestamps
    end
  end
end
