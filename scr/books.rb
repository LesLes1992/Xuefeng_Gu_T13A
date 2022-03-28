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

    def random_book
        data = File.read("booklist.json")
        parsed = JSON.parse(data).sample
        puts "Today's Book is " + "#{parsed["title"]}".colorize(:red).on_blue.underline + " by " +  "#{parsed["author"]}.".colorize(:red).on_blue.underline
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