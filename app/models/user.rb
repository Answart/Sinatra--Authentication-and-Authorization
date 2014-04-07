class User < ActiveRecord::Base

  # From old version of Bcrypt. Doesnt work
  # include BCrypt

  # def password
  #   password ||= Password.new(self.password_hash)
  # end

  # def password=(new_password)
  #   @password = Password.create(new_password)
  #   self.password_hash = @password
  # end

  # def login
  #   @user = User.find_by_email(params[:email])
  #   if @user.password == params[:password]
  #     @user
  #   else
  #     return nil
  #   end
  # end
end



