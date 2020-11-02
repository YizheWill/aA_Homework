require "bcrypt"

pw = "This is password"
password_hash = BCrypt::Password.create(pw) #use create to hash
str = password_hash.to_s
phash = BCrypt::Password.new(str) #use new to regenerate from string
p phash.is_password?("This is password")

# rails g model User username:index:uniq password_digest
# rails db:migrate

# rails console

user = User.new
password = "this is the password"
user.username = "Earl"

user.password_digest = Bcrypt::Password.create(password)
user.save!

user.password_digest # => $2$10$l06..............VVu

BCrypt::Password.new(User.first.password_digest.to_s) == password # => true
BCrypt::Password.new(User.first.password_digest.to_s).is_password?(password) # => true
