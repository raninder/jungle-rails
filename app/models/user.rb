class User < ActiveRecord::Base
	has_secure_password
  validates_uniqueness_of :email, :case_sensitive => false
	validates :first_name, presence: true
	validates :last_name, presence: true
	validates :email, presence: true
	validates :password, length: { minimum: 4 }

	def self.authenticate_with_credentials(email,password)
		email = email.downcase.strip
    @user = User.find_by_email(email)
		 # If the user exists AND the password entered is correct.
    if @user && @user.authenticate(password)
      @user
    else
      nil
    end

	end
end
