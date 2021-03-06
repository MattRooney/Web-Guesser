require 'sinatra'
require 'sinatra/reloader'

Secret_Number = rand(100)
@color = "background: #0016FF;"

get '/' do
  guess = params["guess"].to_i
  message = compare_guess(guess)
  erb :index, :locals => { :number => Secret_Number, :message => message, :color => @color }
end

def compare_guess(guess)
  if guess >= Secret_Number + 5
    @color = "background: #FF0000;"
    message = "Way too high!"
  elsif guess > Secret_Number
    @color = "background: #FF8B92;"
    message = "Too high!"
  elsif guess <= Secret_Number - 5
    @color = "background: #FF0000;"
    message = "Way too low!"
  elsif guess < Secret_Number
    @color = "background: #FF8B92;"
    message = "Too low!"
  elsif guess == Secret_Number
    @color = "background: #00CC6B;"
    message = "You got it! The SECRET NUMBER is #{Secret_Number}."
  end
end
