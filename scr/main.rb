require 'tty-prompt'
require 'colorize'
require 'json'
require './books.rb'
require 'io/console'




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
╚══════╝╚═╝╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝   ╚═╝                                                      
".colorize(:red )
    puts "---------------------------------------------------------------------"
end

def system_clear
    system "clear"
    logo
end

def sign_up
    user = create_profile
    save_profile(user)
    return user #return a hash
end

def log_in
    array_profile = read_profile
    check_user(array_profile)
end 

def main_interface
    prompt = TTY::Prompt.new
    system_clear
    prompt.select("How can I help you?") do |menu|
        menu.choice "Sign up",-> {sign_up}
        menu.choice "Log in",-> {log_in}
        menu.choice "Exit",-> {exit}
    end
end

def introduce_option 
    prompt = TTY::Prompt.new
    options = ["Borrow the book", "Go upper level", "Exit"]
    prompt.select("What to do next?", options)
end

def introduce_control(option,book_name)
    if option == "Borrow the book"
        book = Books.new
        book.make_a_booking(book_name)
    elsif option ==  "Go upper level"
        user_interface
    else
        exit
    end
end

def up_or_exit
    prompt = TTY::Prompt.new
    prompt.select("Do you wanna go upper page or exit?") do |menu|
        menu.choice "Go back upper level",-> {user_interface}
        menu.choice "Exit",-> {exit}
    end
end

def introduce_a_book
    system_clear
    book = Books.new
    book_name= book.introduce_a_book
    introduce_result = introduce_option
    introduce_control(introduce_result, book_name)
    up_or_exit
end

def borrow_a_book
    system_clear
    print "Input your book >>"
    book_name = gets.chomp
    book = Books.new
    book.make_a_booking(book_name)
    up_or_exit
end
    
def return_the_book
    system_clear
    print "Input the name of the returning book >>"
    book =  Books.new
    book.return_a_book
    up_or_exit
end

def user_interface 
    prompt = TTY::Prompt.new
    system_clear
    puts "Welcome back."
    prompt.select("How can I help you?") do |menu|
        menu.choice "Introduce a book",-> {introduce_a_book}
        menu.choice "Borrow a book",-> {borrow_a_book}
        menu.choice "Return the book",-> {return_the_book}
        menu.choice "Exit",-> {exit}
    end
end


def read_profile(file = 'profile.json')
    data = File.read(file)
    # data.close
    return JSON.parse(data) # return array of hash from json file
end

def create_profile(file = 'profile.json')
    system_clear
    array = read_profile(file)
    username = get_username(array)
    password = get_password 
    return {"user" => username , "password" => password}
end

def save_profile(user,file = 'profile.json')
    array = read_profile(file)
    array << user
    File.write(file, JSON.pretty_generate(array))
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
    puts "Password >> "
    while loop_2 != "stop"
        password =  STDIN.noecho(&:gets).chomp!
        puts "Re-enter your password >> "   
        password_sec = STDIN.noecho(&:gets).chomp!
        if password != password_sec
            puts "Invalida password input, please try again >>"
        else
            loop_2 ="stop"
        end
    end
    return password
end

def check_user(array)
    loop = "continue"
    print "Input your username >>"
    while loop != "stop"
        # system_clear
        username = gets.chomp
        puts "Input your password >>"
        password = STDIN.noecho(&:gets).chomp!
        if array.any? {|hash| hash["user"] == username}   #check the input username in the array of hash
            user = array.select {|hash| hash["user"] == username} #select hash username is equal to the input username
            if user[0]["password"] == password
                loop = "stop"
            else
                puts "Invalidate username or password,please re-enter your username >>"
            end
        else
            puts "Invalidate username or password,please re-enter your username >>"
        end
    end
    return username
end

def check_user_output
    puts "Invalidate username or password,please try again >>"
end

def main
    main_interface
    user_interface
end


if ARGV.size == 0
    main
else ARGV == "--help"
    puts "Hi there, This is Coder's library"
    puts "Please follow these instructions to use this application"
    puts "First--change the directory to scr folder "
    puts "Next--View the README.md document for this application's basic informations"
end

