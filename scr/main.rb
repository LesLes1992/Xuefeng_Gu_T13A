require "tty-prompt"
require "colorize"
require_relative "./books.rb"




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
    options = ["Sign up", "Log in ", "Exit"]
    logo
    puts "Welcome to Coder's Library!"
    prompt.select("How can I help you?", options)
end



def main 
    answer = main_header
    
    # if answer == "Today's Book"
    #     system "clear"
    #     logo
    #     Books.new.random_book
    #     puts " Would you like to borrow this book?"
    #     prompt = TTY::Prompt.new
    #     options = ["yes", "no", "back to the main page"]
    #     prompt.select("Would you like to borrow the book?", options)
    # elsif answer == "Find a book"
    #     puts "Please input the book name:"
    #     book_name = gets.chomp.Capitalize    
    # elif answer == "Return a book"

    # end

end

if ARGV.size == 0
    main()
end
