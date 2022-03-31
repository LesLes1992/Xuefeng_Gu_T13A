require "json"
require "tty-prompt"


class Books
    attr_reader :title, :author
    attr_accessor :booking_time, :expire_time, :returned

    def initialize(returned = "yes")
        @title = title
        @author = author
        @returned = returned
        @booking_time = booking_time
        @expire_time = expire_time
    end

    def yes_no_prompt(hash)
        prompt = TTY::Prompt.new
        prompt.select("Do you want to make a booking for future picking up?") do |menu|
            menu.choice "Yes",-> {return "yes"}
            menu.choice "Go upper level",-> {user_interface}
            menu.choice "Exit",-> {exit}
        end
    end


    def read_booklist(file = 'booklist.json')
        data = File.read(file)
        return JSON.parse(data) # return array of hash from json file
    end
    
    def introduce_a_book(file = 'booklist.json')
        parsed = read_booklist(file).sample #parsed is a hash
        puts "Today's Book is " + "#{parsed["title"]}".colorize(:red).on_blue+ " by " +  "#{parsed["author"]}.".colorize(:red).on_blue
        puts "======================================================================"
        return parsed["title"] #return a bookname
    end

    def find_a_book(file = 'booklist.json',bookname)
        array = read_booklist
        if array.any? {|hash| hash["title"] == bookname}   
            result= array.detect {|hash| hash["title"].include?(bookname)} 
            return result  # return a hash contain the key-value pair
        end
    end

    def make_a_booking(file = 'booklist.json',bookname)
        json_array = read_booklist(file) # get the whole json array
        book_hash = find_a_book(file ,bookname) 
        if book_hash != nil
            json_array.delete(book_hash)
            if book_hash["returned"] == "no" and book_hash["booking_time"] == "yes"
                puts "Sorry, this booked has been booked.Someone will pick up after #{book_hash["expire_time"]}"
            elsif book_hash["returned"] == "yes" and book_hash["booking_time"] == "yes"
                puts "Sorry, this booked has been booked.Someone will pick up in the short future"
            elsif book_hash["returned"] == "no"
                puts "Sorry, this booked has been taken.It will be returned after #{book_hash["expire_time"]}"
                book_hash["booking_time"] = yes_no_prompt(book_hash)
            else
                book_hash["expire_time"] = (Time.new + 1209600).strftime("%B %d, %Y")
                book_hash["returned"] = "no"
                puts "---------------------------------------------------------------------------------"
                puts "Thank you borrowing the book, you have to return it by #{book_hash["expire_time"]}"  
            end
            json_array.unshift(book_hash)
            File.write(file, JSON.pretty_generate(json_array))   
        else
            puts "We can't find your book"
        end
    end


    def return_a_book(file = 'booklist.json')
        json_array = read_booklist(file) # get the whole json array
        loop = 1
        while loop < 10000
            bookname = gets.chomp
            book_hash = find_a_book(file ,bookname)
            if book_hash != nil
                json_array.delete(book_hash)
                book_hash["returned"] = "yes"
                book_hash["expire_time"] = ""
                json_array.unshift(book_hash)
                File.write(file, JSON.pretty_generate(json_array))
                loop = 10000
                puts "You have successfully return the book"
            elsif loop % 5 ==0
                up_or_exit
            else
                print "Invalida book name. Please input the bookname again >>"
            end
            loop += 1 
        end
    end       
end