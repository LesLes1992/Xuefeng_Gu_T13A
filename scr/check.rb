require "json"

def create_profile(file)
    system "clear"
    username = get_username(file)   
    password = get_password
    verify_password #check password is right.
    scurity = get_security
end

def get_username(file)
    while loop != "stop"
        print "Input your user name  >> "
        username =  gets.chomp!
        hash = read_profiles(file)
        if username.empty?
            puts "Username can't be empty,please input again"
        elsif hash.include? (username)
            puts "The username has been taken, please try another one"
        else
            loop = "stop"
        end
    end
    return username
end

def read_profiles(file)
    data = File.read(file)
    return JSON.parse(data).sample
end

def main
    create_profile("profile.json")
end

main