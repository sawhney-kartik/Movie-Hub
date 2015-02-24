require 'digest/sha2'

class User < ActiveRecord::Base
   has_many :movies
   has_many :comments
   has_many :friends
def password=(original)
      @originalPassword = original
      self.salt = SecureRandom.hex(20)
      digester=Digest::SHA2.new(512)
      self.password_digest = digester.hexdigest(@originalPassword+self.salt)
   end

   def password
      @originalPassword
   end

   def password_valid?(enteredPassword)
      digester=Digest::SHA2.new(512)
      code= digester.hexdigest(enteredPassword+self.salt)
      if code==self.password_digest
         return true
      else
         return false
      end
   end

   validates :first_name, :last_name, :login, :presence => true
   validates :login, :uniqueness => true
   validates_format_of :login, :with => /[a-zA-Z0-9_-]+/, :message => "only letters, numbers, underscores (_), and dashes (-) are allowed"
   validates_confirmation_of :password
   validates_confirmation_of :first_name
end
