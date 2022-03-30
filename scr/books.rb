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

    def read_booklist(file = 'booklist.json')
        data = File.read(file)
        return JSON.parse(data) # return array of hash from json file
    end
    
    def introduce_a_book(file = 'booklist.json')
        parsed = read_booklist(file).sample #parsed is a hash
        puts "Today's Book is " + "#{parsed["title"]}".colorize(:red).on_blue.underline + " by " +  "#{parsed["author"]}.".colorize(:red).on_blue.underline
        puts "======================================================================"
        return parsed["title"]
    end

    def choose_book(book)
        prompt = TTY::Prompt.new
        options = ["Yes", "No", "Exit"]
        prompt.select("Do you mean #{book["title"]} by #{book["author"]}?", options)
    end

    def find_a_book(file = 'booklist.json',title)
        array = read_booklist
        if array.any? {|hash| hash["title"] == title}   
            result= array.detect {|hash| hash["title"].include?(title)} # return a hash contain the key-value pair
            return result
            answer = choose_book(result)
            if answer == "Yes"
                
            elsif answer == "No"
                puts "Sorry, we don't have the book you looking for."
            else 
                exit
            end
        else    
            puts "Sorry, we don't have the book you looking for."
        end
    end

    def make_a_booking(file = 'booklist.json',title)
        json_array = read_booklist(file) # get the whole json array
        book_hash = find_a_book(file ,title) # return a hash contain book information
        json_array.delete(book_hash)
        if book_hash["returned"] == "no"
            puts "Sorry, this booked has been book.It will be returned after #{book_hash["expire_time"]}"
        else
            book_hash["expire_time"] = (Time.new + 1209600).strftime("%B %d, %Y")
            json_array.unshift(book_hash)
            File.write(file, JSON.pretty_generate(json_array))
            puts "Thank you making a booking, you have to return it by #{book_hash["expire_time"]}"
        end
    end



    def update_booking_time

    end

    def update_expire_date

    end

    def update_return

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