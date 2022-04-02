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
https://trello.com/b/rACuCMep/chris-finance-app

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
### Profile Creation
Checklist
1. Create a profile class to store data
- Approximation of time needed to complete: 1 hours. Deadline: Wednesday April 7, 2021. Priority: HIGH.
2. Create data structures to manage data
- Approximation of time needed to complete: 2 hours. Deadline: Wednesday April 7, 2021. Priority: HIGH.
3. Update profile class dependent on user purchasing actions
- Approximation of time needed to complete:  6 hours. Deadline: Thursday April 8, 2021. Priority: HIGH.
4. Read and write to JSON file
- Approximation of time needed to complete: 4 hours. Deadline: Wednesday April 7, 2021. Priority: HIGH.
5. Error Handling
- Approximation of time needed to complete: 3 hours. Deadline: Saturday April 10, 2021. Priority: HIGH.

### Execution of Trades (Buy/Sell)
Checklist
1. Create Stock class to manage data on the stock to trade
- Approximation of time needed to complete: 1 hours. Deadline: Thursday April 8, 2021. Priority: HIGH.
2. Connect communications with IEX API
    - Ensure key is valid
    - Get up to date stock information
- Approximation of time needed to complete: 2 hours. Deadline: Saturday April 10, 2021. Priority: HIGH.

3. Give feedback to user reguarding current prices
- Approximation of time needed to complete: 1 hours. Deadline: Saturday April 10, 2021. Priority: HIGH.

4. Process trade
    - Validate trade
    - Update profile data
    - Feedback to user
- Approximation of time needed to complete: 2 hours. Deadline: Saturday April 10, 2021. Priority: HIGH.

5. Error Handling
- Approximation of time needed to complete: 3 hours. Deadline: Sunday April 11, 2021. Priority: HIGH.

### Profile/Investment Summaries
Checklist
1. Update data to be displayed 
- Approximation of time needed to complete: 2 hours. Deadline: Friday April 9, 2021. Priority: HIGH.

2. Create tables to display to user

 Approximation of time needed to complete: 1 hour. Deadline Friday April 9, 2021. Priority: HIGH.

3. Make calculations to display to user

Information needs to be calculated in order to get a proper summary. For example, all stock values need to be checked against their current values in order to see how much growth our profile has made. 
- Approximation of time needed to complete: 1 hour. Deadline Friday April 9, 2021. Priority: HIGH.

4. Utilize tty-table to format
- Approximation of time needed to complete: 1 hours. Deadline: Friday April 9, 2021. Priority: HIGH.


5. Test outputs are correct

Testing is required to make sure tables are being generated properly. Handle exceptions for tables trying to be generated when no trades have been made. 

- Approximation of time needed to complete: 3 hours. Deadline: Saturday April 11, 2021. Priority: HIGH.



# R8 Help

Download and install Ruby onto your computer. Instructions on how to do so can be found here: [Ruby installation guide](https://www.ruby-lang.org/en/documentation/installation/ "Ruby installation")

Run this command in your terminal:
```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ChrisBaker-dev/TerminalApplication/main/src/install.sh)"
```

**If you are having issues with this command you may need to check your gem paths**

### Hardware Requirements
This application should run on all platforms. No known hardware requirements.



