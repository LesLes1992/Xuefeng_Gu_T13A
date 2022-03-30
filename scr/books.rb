require "json"


class Books
    attr_reader :title, :author
    attr_accessor :booking_time, :expire_time, :returned

    def initialize(returned = "yes")
        @title = ""
        @author = ""
        @returned = returned
        @booking_time = ""
        @expire_time = ""
    end
    def read_booklist(file)
        data = File.read(file)
        # data.close
        return JSON.parse(data) # return array of hash from json file
    end
    
    def introduce_a_book(file)
        parsed = read_booklist(file).sample
        puts "======================================================================"
        puts "Today's Book is " + "#{parsed["title"]}".colorize(:red).on_blue.underline + " by " +  "#{parsed["author"]}.".colorize(:red).on_blue.underline
        puts "======================================================================"
    end
    def find_a_book
        read_booklist(file)
    end
    def make_a_booking

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