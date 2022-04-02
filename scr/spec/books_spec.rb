require 'rspec'
require 'colorize'
require "json"
require_relative '../books.rb'




   describe Books do
      describe "#introduce_a_book" do
         it "expecting to intorduce randomely" do
            book = Books.new
            introduced = book.introduce_a_book
            expect(introduced).to be_truthy
         end
      end

      describe "#find_a_book" do
         it "" do 
            book = Books.new
            result = book.find_a_book('WOMEN IN LOVE')
            expect(result).to be_kind_of Hash
         end
      end
   end
