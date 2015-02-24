class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
    	t.string   :first_name
    	t.string   :last_name
			t.string   :login
			t.string   :salt
			t.string   :password_digest
			t.string   :interests
			t.string   :ad_interests
      t.timestamps
    end
  end
end
