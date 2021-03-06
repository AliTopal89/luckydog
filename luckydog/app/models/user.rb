class User < ActiveRecord::Base

	validates :email, :presence => true, :uniqueness => true
	has_secure_password
	validates_presence_of :password, :on => :create
	before_create {generate_token(:remember_me) }

	def generate_token(column)
		begin
			self[column] = SecureRandom.urlsafe_base64
		end while User.exists?(column => self[column])
	end

end
