class Movie < ActiveRecord::Base
	belongs_to :user
   has_many :comments
   def upload(fileObject)
      fileName = fileObject.original_filename
      directory = "app/assets/Books"
      path = File.join(directory, fileName)
      File.open(path, "wb") { |f| f.write(fileObject.read) }
   end
   validates :movie_name, :movie_tags, :presence => true
end
