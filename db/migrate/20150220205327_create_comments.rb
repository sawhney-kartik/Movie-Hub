class CreateComments < ActiveRecord::Migration
  def change
  	create_table :comments do |t|
      t.integer  :movie_id
  	  t.integer   :user_id
    	t.datetime :date_time
    	t.string   :comment
      t.timestamps
    end
  end
end
