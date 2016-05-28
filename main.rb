# This is the main entrypoint into the program
# It requires the other files/gems that it needs

require 'pry'
require './candidates'
require './filters'

## Your test code can go here

# binding.pry

def print_menu
  puts "1 Type in the ID you want"
  puts "2 All"
  puts "3 Qualified"
  puts "4 Quit"
end

def get_input
  input = gets.chomp
  input
end

while true do
  print_menu
  input = get_input
  case input
  when "1"
    id = get_input
    pp find(id)
  when "2" #this one works
    pp @candidates
  when "3" #this one works
    pp ordered_by_qualifications(qualified_candidates(@candidates))
  when "4" #this one works
    break
  end
end

# pp qualified_candidates(@candidates)
# puts ordered_by_qualifications(@candidates)