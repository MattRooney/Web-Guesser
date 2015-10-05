require 'sinatra'
require 'sinatra/reloader'

Secret_Number = rand(100)

get '/' do
  guess = params["guess"].to_i
  message = compare_guess(guess)
  erb :index, :locals => {:number => Secret_Number, :message => message}
end

def compare_guess(guess)
  if guess >= Secret_Number + 5
    message = "Way too high!"
  elsif guess > Secret_Number
    message = "Too high!"
  elsif guess <= Secret_Number - 5
    message = "Way too low!"
  elsif guess < Secret_Number
    message = "Too low!"
  elsif guess == Secret_Number
    message = "You got it! The SECRET NUMBER is #{Secret_Number}."
  end
end
