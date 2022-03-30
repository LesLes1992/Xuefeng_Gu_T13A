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
        options = ["Yes", "Exit"] 
        answer = prompt.select("Do you want to make a booking for future picking up?", options)
        if answer == "Yes"
            Time.now.strftime("%B %d, %Y")
        else
            exit
        end
    end

    def read_booklist(file = 'booklist.json')
        data = File.read(file)
        return JSON.parse(data) # return array of hash from json file
    end
    
    def introduce_a_book(file = 'booklist.json')
        parsed = read_booklist(file).sample #parsed is a hash
        puts "Today's Book is " + "#{parsed["title"]}".colorize(:red).on_blue.underline + " by " +  "#{parsed["author"]}.".colorize(:red).on_blue.underline
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
            if book_hash["returned"] == "no"
                puts "Sorry, this booked has been taken.It will be returned after #{book_hash["expire_time"]}"
                book_hash["booking_time"] = yes_no_prompt(book_hash)
            elsif book_hash["returned"] == "no" and book_hash["booking_time"] != nil
                puts "Sorry, this booked has been taken.Someone will pick upclear after #{book_hash["expire_time"]}"
            else
                book_hash["expire_time"] = (Time.new + 1209600).strftime("%B %d, %Y")
                book_hash["returned"] = "no"
                puts "Thank you making a booking, you have to return it by #{book_hash["expire_time"]}"  
            end
            json_array.unshift(book_hash)
            File.write(file, JSON.pretty_generate(json_array))   
        else
            puts "We can't find your book"
        end
    end


    def return_a_book(file = 'booklist.json')
        json_array = read_booklist(file) # get the whole json array
        loop = "continue"
        while loop != "stop"
            bookname = gets.chomp
            book_hash = find_a_book(file ,bookname)
            if book_hash != nil
                json_array.delete(book_hash)
                book_hash["returned"] = "yes"
                book_hash["expire_time"] = ""
                json_array.unshift(book_hash)
                File.write(file, JSON.pretty_generate(json_array))
                loop = "stop"
            else
                puts "Please input the bookname again >>"
            end
        end
    end

        
end









# pp parsed
# pp parsed[0].class
# pp parsed[0]["title"]

# parsed[0]["returned"] = "no"
# booking_time = Time.new
# expire_time = booking_time + 1209600
# parsed[0]["booking_time"] = booking_time.strftime("%B %d, %Y")
# parsed[0]["expire_time"] = expire_time.strftime("%B %d, %Y")
# File.write("Booklist.json", JSON.pretty_generate(parsed))

# p parsed[0]


# end