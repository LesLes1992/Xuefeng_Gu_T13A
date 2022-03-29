require "tty-prompt"
require "json"

class Profile
    attr_accessor: @security
    attr_reader: @username
    attr_writer: @password

    def initialize (username)
        @username = username
        @password = password
        @security = security
    end

    #sign-up to create a new account
    def create_profile
            @username = get_username #check the username is valid or not?
            raise("name can't be empty") if @username.empty?
            
            @password = get_password
            print "Re-enter your password >> "
            password_sec = gets.chomp  #check password is right.
            if @password == password_sec
            
    end

    def get_username
        print "Input your user name  >> "
        return gets.chomp!
    end

    def get_password
        print "Password >> "
        return gets.chomp!
    end
    
    def read_profiles(files)
        data = File.read(files)
        parsed = JSON.parse(data).sample
    end

    def
    #log-in to search the username or password in the json file
    def check_profile
    end

    #change the password
    def change_password
    end

end



