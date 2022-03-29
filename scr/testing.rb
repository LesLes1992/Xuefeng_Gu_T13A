def create_profile(file)
    system "clear"
    array = read_profile(file)
    username = get_username(array)
    password = get_password 
    profile =  {username => password}
end


def read_profile(file)
    data = File.read(file)
    data.close
    return JSON.parse(data) # return array of hash
end

def get_username(array)
    loop = "continue"
    print "Input your username  >> "
    while loop != "stop"
        username = gets.chomp!
        if username.empty?
            print "Username can't be empty,please input again >>"
        elsif array.any? {|hash| hash["user"] == "username"}
            print "The username has been taken, please try another one >>"
        else
            loop = "stop"
        end
    end
    return username
end

def get_password
    loop_2 = "continue"
    print "Password >> "
    while loop_2 != "stop"
        password =  gets.chomp!
        print "Re-enter your password >> "   
        password_sec = gets.chomp!
        if password != password_sec
            print "Invalida password input, please try again >>"
        else
            loop_2 ="stop"
        end
    end
    return password
end

def save_profile(user, file)
    File.write(file, JSON.dump(user))
end

def main 
    answer = main_header
    if answer == "Sign up"
        user = create_profile('profile.json')
        save_profile(user, 'profile.json') 
    end
end

if ARGV.size == 0
    main
end
