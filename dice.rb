require "sinatra"
require "sinatra/reloader"
require "better_errors"
require "binding_of_caller"
use(BetterErrors::Middleware)
BetterErrors.application_root = __dir__
BetterErrors::Middleware.allow_ip!('0.0.0.0/0.0.0.0')

get("/") do
  erb(:elephant, { :layout => :wrapper })
end


get("/2/6") do
  first_die = rand(1..6)
  second_die = rand(1..6)
  @outcome = "You rolled #{first_die} and #{second_die} for a total of #{first_die + second_die}"
  erb(:two_six, { :layout => :wrapper })
end

get("/2/10") do 
  first_die = rand(1..10)
  second_die = rand(1..10)
  @outcome = "You rolled #{first_die} and #{second_die} for a total of #{first_die + second_die}"
  erb(:two_ten, { :layout => :wrapper })
end

get("/1/20") do
  @die = rand(1..20)
  @outcome = "You rolled #{@die}"
  erb(:one_twenty, { :layout => :wrapper })
end

get("/5/4") do
  dice = []
  5.times do
    dice.push(rand(1..4))
  end
  @outcome = "You rolled #{dice.join(", ")} for a total of #{dice.sum}"
  erb(:five_four, { :layout => :wrapper })
end
get("/100/6") do
  @rolls = []
  100.times do 
    @rolls.push(rand(1..100))
  end

  erb(:one_hundred_six, { :layout => :wrapper })
end
