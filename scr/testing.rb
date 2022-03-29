
def create_profile
    @username = get_username
    @password = get_password
    print "Re-enter your password >> "
    password_sec = gets.chomp
        if @password == password_sec
            puts"yes"
        else
            puts "no"
        end
        
end

def get_username
    print "Input your user name  >> "
    return gets.chomp
end

def get_password
    print "Password >> "
    return gets.chomp
end

create_profile