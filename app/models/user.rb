class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation

  attr_accessor :password
  before_save :encrypt_password

  validates_confirmation_of :password, :on => :create
  validates_presence_of :email 
  validates_uniqueness_of :email 
# validates_blank_of is something that's built into rails
# all of them have default messages
#why are we putting this in the method?


  def self.authenticate(email, password)
  	user = find_by_email(email)
  	if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
  		user
  	else
  		nil
  	end
  end

  def encrypt_password
  	if password.present?
  		self.password_salt = BCrypt::Engine.generate_salt
  		self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
  	end
  end
end

#In the console, you need to add in password and password hash to the User. So in the console, you type in rails g migration AddPasswordHashtoUser password_hash:string
# That adds password hash.  Then you run rake db:migrate
# rails g migration AddPasswordSaltToUser password_salt:string
# then do rake db:migrate
#you need to add these into the user.  So in the console, if you type in User, before you did this you will see only name and email in there>
# after you do this you'll have: 1.9.3p392 :001 > User
  #     => User(id: integer, name: string, email: string, created_at: datetime, updated_at: datetime, password_salt: string, password_hash: string)




