# Xuefen Gu - T1A3 CLI Application

## Description

This is a library application, which has a json file holding the booklist. This appplication will help users to 

1. Find a book
2. Make a booking for a borrowed book
3. Borrow a book 
4. Return a book. 

## R3 - Referenced Sources

Ruby Gems which have been practiced in this application:

##### tty-prompt

https://github.com/piotrmurach/tty-prompt

##### Colorize 

https://github.com/fazibear/colorize

## R4 - Repository

---
Repository:
https://github.com/LesLes1992/library

Trello: 
https://trello.com/b/JqLdrOhr/t1a3-cli-aapplication

## R6 - Features
---
This application has  features like below:
1. Sign-up and log-in
2. Introdude a book and borrow the book
2. Borrow a book
3. Return a book

### Sign-up and log -in
This feature will be basic feature to use an application. **Sign-up** will help user to create a username-and-password pair, which will be writed into a json file. **Log-in** is the feature to check the username-and-password pair in the json file. If we can find the data in the json file, we can let the user log into the application to make some functions (Borrow a book, etc ) 

### Introduce a book
**Introduce a book** will randomly pick up a book from booklist json file. After the application tell the book, they will ask you further choice 

1. **Borrow the book** , the application will check the book status (It has been borrowed or not ) to let you know if you can make a booking.
2. **Go back**
3. **Exit**

### Borrow a book
**Borrow a book** is the most important feature for a library application. It will help the user to find the book they want and borrow the book accodring to the book status. In the json file, a book has 5 attributes

1. Title: the book name
2. Author: the books' authors
3. Booking-time: If the book has been borrowed, application will ask the user if they wanna make a booking for the future picking-up.
4. Expire-time: Changed after user make a booking, the exire time will be the day pf borrowing plus 2 weeks.
5. Returned : "yes" and "no" values to tell the system the books have been returned or not.

### Return a book

**Return a book** is another main feature, which let the user return the books they borrowed. After teh user return the book, the book status will be changed. **Expire-time** will be nil. And **Returned** will be "yes"

## R7 - Implementation Plan
### Sign-in and Log-in( Due 28/03/2022)
Checklist
* Create a prompt to let the user to create or type in their username and passwords
  * REQUIRE: around 1 hours. 
  *  Priority: High.

- ``Touch`` a ``profiles.json`` file to save the user informations.
  - REQUIRE: 0.5 hours. 
  - Priority: High.

- Check if the username in the json file
  - REQUIRE: 1 hours. 
  - Priority: High.
- Write the user's information into the json file
  - REQUIRE: 1 hours. 
  - Priority: High.
- Check the username and password matching or not
  - REQUIRE: 1 hours. 
  - Priority: High.
### Introduce a book(Due 29/03/2022)
Checklist
- Build up an appropriate ``booklist.json`` file to contain all. the books information
  - REQUIRE: 0.5 -1 hours. 
  - Priority: Medium.
- Create an appropriate prompt with ``TTY-Prompt``
  - REQUIRE: 1 hours. 
  - Priority: High
- Present the result into an approprite format 
  - REQUIRE: 0.5 hours. 
  - Priority: Low.
- Further user interface set-up
  - REQUIRE: 0.5 -1hours. 
  - Priority: Medium.
- "Borrow this book? " and "Making a booking " functions set up
  - Require: 2 hours. 
  - Priority: High.
### Borrow a book(Due 29/03/2022)
Checklist
- Find a book to check if the book in the json file
  - Require: 2 hours
  - Priority: High.

- Check if the book is the one 
  - Require: 0.5 - 1 hours
  - Priority: Low. 


- Borrow the book 

  Change the books attribute values.

  - Require:  1-2 hours
  - Priority: High. 

- Make a booking if the book has been borrowed
  - Require:  1 hours
  - Priority:  Medium. 

- Testing the json changed books attribute values as expectations.

### Return a book(Due 30/03/2022)

Checklist

- Find a book to check if the book in the json file
  - Require: 0.5-1 hours
  - Priority: Low.
- Check if the book is right name with loop
  - Require: 2 hours
  - Priority: High. 

- Return the book method set up 

  Change the books attribute values after return the books.

  - Require:  1 hour
  - Priority: High. 

- Provide up coming choices after return the books

  Go- upper level or exit

  - Require:  0.5 hour
  - Priority:  Low. 

- Testing the json changed books attribute values as expectations.



# R8 Help

### Hardware Requirements
This application should run on all platforms. No known hardware requirements.

### How to use the application

**First** -- Download and install Ruby onto your computer. Instructions on how to do so can be found here: [Ruby installation guide](https://www.ruby-lang.org/en/documentation/installation/ "Ruby installation")

**Next** -- open the terminal in MacOs or cmd in Windows system

**Next** -- Use ``cd  ``commond line to change the directory to ``src`` folder.

**Next** -- Install ``bundler`` gem into the system with code ``$ gem install bundler``

**Next** -- Run code ``$ bundle install`` to install all the gems under this project. 

**Next** -- Run code ``$ ruby main.rb`` to run the application.

**TIPS** -- Run code ``ruby main.rb --help`` to search for help 





