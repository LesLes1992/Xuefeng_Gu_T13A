require "tty-prompt"
require "colorize"
require_relative "./books.rb"
# require_relative "./profiles.rb"




#welcome message and provide options to choose
#executed next accoding to user's input

def logo
    puts "---------------------------------------------------------------------"
    puts "                                                              
    ██╗     ██╗██████╗ ██████╗  █████╗ ██████╗ ██╗   ██╗      
    ██║     ██║██╔══██╗██╔══██╗██╔══██╗██╔══██╗╚██╗ ██╔╝      
    ██║     ██║██████╔╝██████╔╝███████║██████╔╝ ╚████╔╝       
    ██║     ██║██╔══██╗██╔══██╗██╔══██║██╔══██╗  ╚██╔╝        
    ███████╗██║██████╔╝██║  ██║██║  ██║██║  ██║   ██║         
    ╚══════╝╚═╝╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝   ╚═╝         ".colorize(:red )
    puts "---------------------------------------------------------------------"
end

def main_header
    prompt = TTY::Prompt.new
    options = ["Sign up", "Log in", "Exit"]
    logo
    puts "Welcome to Coder's Library!"
    prompt.select("How can I help you?", options)
end
#create a sign-up profile and 
def create_profile(file)
    system "clear"
    array = read_profile(file)
    username = get_username(array)
    password = get_password 
    return {"user" => username , "password" => password}
end

def read_profile(file)
    data = File.read(file)
    # data.close
    return JSON.parse(data) # return array of hash from json file
end

def get_username(array)
    loop = "continue"
    print "Input your username  >> "
    while loop != "stop"
        username = gets.chomp!
        if username.empty?
            print "Username can't be empty,please input again >>"
        elsif array.any? {|hash| hash["user"] == username}
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

def save_profile(user,file)
    array = read_profile(file)
    array << user
    File.write(file, JSON.pretty_generate(array))
end

def check_user(array)
    loop = "continue"
    while loop != "stop"
        print "Input your username >>"
        username = gets.chomp
        print "Input your password >>"
        password = gets.chomp
        if array.any? {|hash| hash["user"] == username}   #check the input username in the array of hash
            user = array.select {|hash| hash["user"] == username} #select hash username is equal to the input username
            if user[0]["password"] == password
                puts"Welcome back."
                loop = "stop"
            else
                check_user_output
            end
        else
            check_user_output
        end
    end
end

def check_user_output
    system "clear"
    logo
    puts "Invalidate username or password,please try again >>"
end
def main 
    answer = main_header
    if answer == "Sign up"
        user = create_profile('profile.json')
        save_profile(user, 'profile.json') 
    elsif answer == "Log in"
        array = read_profile('profile.json')
        check_user(array)
    else
        system "quit"
    end
end

if ARGV.size == 0
    main
end