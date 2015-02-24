class Friend < ActiveRecord::Base
	 belongs_to :user
   validates :user_id2, presence: true
end
