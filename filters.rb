# In this file we define the methods to help filter out candidates
# This way, we keep these methods separated from other potential parts of the program
require 'active_support/all'
#require 'pry'

#the next function:
# Takes in an id
# Returns the candidate with that :id
# If there is no candidate with that id, it naturally returns nil

def find(id)
  # @candidates.detect{|candidate| candidate[:id] == id.to_i} 
  @candidates.each{|candidate| return candidate if candidate[:id] == id.to_i}
end



#the next function:
# Takes in a single candidate (hash). Note: not the array.
# Returns true if the candidate has 2 years of experience or more
# Returns false otherwise
def experienced?(candidate)
  if candidate[:years_of_experience] >= 2
    true
  else
     false
  end
end

#the next method is supposed to:
#filter the candidates who know at least Ruby and Python

def ruby_python?(candidate)
  if candidate[:languages].include?('Ruby') || candidate[:languages].include?('Python')
    true
  else
     false
  end
end

#the next method is supposed to:
#check for candidates who applied in the last 15 days

def fresh_application?(candidate)
    #pay attention when comparing dates!!! draw a time line, they're not just numbers
  # if candidate[:date_applied] > 15.days.ago.to_date
  #   true
  # else
  #   false
  # end
  candidate[:date_applied] > 15.days.ago.to_date
end

#the next method:
# Takes in the collection of candidates
# Returns a subset of the candidates that meet the following criteria:
#   Are experienced
#   Have 100 or more Github points
#   Know at least Ruby or Python
#   Applied in the last 15 days
#   Are over the age of 17 (18+)
def qualified_candidates(candidates)
  result = []
  candidates.each do |candidate|
    if experienced?(candidate) && (candidate[:github_points] > 100) && (candidate[:age] >= 18) && ruby_python?(candidate) && fresh_application?(candidate)
      result << candidate
    end
  end
  result
end


#the next method is supposed to:
# return the candidates all back but reordered such that:
# Candidates with the most experience are at the top
# For Candidates that have the same years of experience, they are further sorted by their number of Github points (highest first)
def ordered_by_qualifications(candidates)
  candidates.sort_by {|k| [-k[:years_of_experience], -k[:github_points]]}
end

