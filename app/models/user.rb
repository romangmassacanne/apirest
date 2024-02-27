class User < ApplicationRecord

    #has_secure_password
    
    def authenticate(password)
        puts "paso por acaaaaa"
        return self if password_digest == password
        false
    end

    #validates_length_of :password, maximum: 72, minimum: 0, allow_nil: false, allow_blanck: false

    #validates_presence_of :email
    #validates_presence_of :username
    #validates_uniqueness_of :email
    #validates_uniqueness_of :username

    #def authenticate(email, password)
    #    puts "esto es #{params}"
    #    email = params[:auth][:email]
    #    password = params[:auth][:password]
    #    user = find_by(email: email)
    #    return user if user && user.authenticate(password)
    #end
end
