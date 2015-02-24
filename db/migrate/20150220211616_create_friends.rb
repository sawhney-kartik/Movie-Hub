class CreateFriends < ActiveRecord::Migration
  def change
    create_table :friends do |t|
    	t.integer  :user_id
			t.integer  :user_id2
			t.datetime :date_time
      t.timestamps
    end
  end
end
