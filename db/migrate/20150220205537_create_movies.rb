class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
    	t.integer		:user_id
			t.string   	:movie_name
			t.string   	:movie_director
			t.string   	:movie_tags
			t.string   	:ratings
			t.string   	:availability
			t.datetime  :date_time
      t.timestamps
    end
  end
end
