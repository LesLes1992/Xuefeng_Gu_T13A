require "tty-prompt"
require "json"

class Profile
    attr_accessor: @security
    attr_reader: @username
    attr_writer: @password

    def initialize (username)
        @username = username
        @password = password
        @security = security
    end

    #log-in to search the username or password in the json file
    def check_profile
    end

    #change the password
    def change_password
    end

end



