  require 'pry'

  names = []
  File.open("name.txt", "r").each do |name|
  # Seperate each name by the comma & input into an array
    names = name.gsub('"', '').chomp.split(",")
  end

  # sort array alphabetically
  names.sort_by!{ |n| n.downcase}

  # create hash of "A" => 1
  alph = {}
  (('A'..'Z').zip(1..26)).each { |a| alph[a[0]] = a[1] }

  # add letters in each name & find sum
  @name_sum = []
  names.each do |name|
    name_numbers = name.split('').map{ |x| alph[x]}
    name_total = name_numbers.inject{|sum,x| sum + x }
    @name_sum << name_total
  end

  # add sum with name position
  @scores = []
  @name_sum.each_with_index do |sum, i|
    position = i + 1
    score = sum * position
    @scores << score
  end

  # create hash with name => name_score
  name_scores = {}
  (names.zip(@scores)).each{ |a| name_scores[a[0]] = a[1] }
  puts name_scores["COLIN"]

  # total score
  @total = @scores.inject{|sum, x| sum + x}
  puts @total



# REFRACTOR INTO CLASS & METHODS
# WRITE TESTS


