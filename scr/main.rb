require 'tty-prompt'
require 'colorize'
require 'json'
require_relative "./books.rb"
require "io/console"




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

def system_clear
    system"clear"
    logo
end

def main_header
    prompt = TTY::Prompt.new
    options = ["Sign up", "Log in", "Exit"]
    logo
    puts "Welcome to Coder's Library!"
    prompt.select("How can I help you?", options)
end

def user_header (username)
    prompt = TTY::Prompt.new
    options = ["Introduce a book", "Make a booking", "Return the book", "Exit"]
    system_clear
    puts "Welcome back #{username}."
    prompt.select("How can I help you?", options)
end

def introduce_header 
    prompt = TTY::Prompt.new
    options = ["Make a booking", "Exit"]
    prompt.select("What to do next?", options)
end
#create a sign-up profile and 
def create_profile(file)
    system_clear
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
        password =  STDIN.noecho(&:gets).chomp!
        print "Re-enter your password >> "   
        password_sec = STDIN.noecho(&:gets).chomp!
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
    # json.close
end

def check_user(array)
    loop = "continue"
    print "Input your username >>"
    while loop != "stop"
        # system_clear
        username = gets.chomp
        print "Input your password >>"
        password = STDIN.noecho(&:gets).chomp!
        if array.any? {|hash| hash["user"] == username}   #check the input username in the array of hash
            user = array.select {|hash| hash["user"] == username} #select hash username is equal to the input username
            if user[0]["password"] == password
                loop = "stop"
            else
                print "Invalidate username or password,please try again >>"
            end
        else
            print "Invalidate username or password,please try again >>"
        end
    end
    return username
end

def check_user_output
    puts "Invalidate username or password,please try again >>"
end

def option_main_control(option)
    if  option== "Sign up"
        user = create_profile('profile.json')
        save_profile(user, 'profile.json')
        return user 
    elsif option == "Log in"
        array_profile = read_profile('profile.json')
        check_user(array_profile)
    else 
        exit
    end
end


def option_user_control(option, username)
    if option == "Introduce a book"
        system_clear
        book = Books.new
        book_name= book.introduce_a_book
        option_introduce = introduce_header 
        introduce_control(option_introduce, username,book_name)
    elsif option == "Make a booking"
        system_clear
        print "Input your book >>"
        book_name = gets.chomp
        book = Books.new
        book.make_a_booking(book_name)
    elsif option == "Return the book"
        exit
    else
        exit
    end
end

def introduce_control(option, username,book_name)
    if option == "Make a booking"
        book = Books.new
        book.make_a_booking(book_name)
    else
        exit
    end
end

def make_booking_control(option)
end

def return_book_control(option)
end





def main 
    option_main = main_header
    username = option_main_control(option_main)
    option_user = user_header(username)
    option_user_control(option_user,username)
    
end

if ARGV.size == 0
    main
end

