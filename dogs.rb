require_relative "testing_library"


def how_many_dogs(dogs)
  dogs.length
end

def name_lengths(dogs)
  dogs.map {|dog| dog.length }
end

def reverse_dog_names(dogs)
  dogs.map {|dog| dog.reverse }
end

def first_three_dogs_with_each(dogs)
  temp = []
  dogs.each {|dog| temp << dog if dog[0] < 'P'}
  temp
end

def first_three_dogs_without_each(dogs)
  dogs[0..2]
end

def reverse_case_dog_names(dogs)
  dogs.map {|dog| dog.swapcase }
end

def sum_of_all_dog_name_lengths(dogs)
  dogs.inject(0) {|sum, dog| sum += dog.length}
end

def dogs_with_long_names(dogs)
  dogs.map {|dog| dog.length > 4 }
end

puts "*"*80
puts "Make each method return the correct value"
puts "The check method will run and tell you if the answer is correct"
puts "*"*80

awesome_dog_array = ["Fido", "Harleigh", "Mali", "Trixie", "Snow", "Victory"]
small_dog_array = ["Fido", "Harleigh"]

check("how_many_dogs", how_many_dogs(awesome_dog_array) == 6)
check("how_many_dogs", how_many_dogs(small_dog_array) == 2)
check("name_lengths", name_lengths(awesome_dog_array) == [4, 8, 4, 6, 4, 7])
check("reverse_dog_names", reverse_dog_names(awesome_dog_array) == ["odiF", "hgielraH", "ilaM", "eixirT", "wonS", "yrotciV"])
check("first_three_dogs_with_each", first_three_dogs_with_each(awesome_dog_array) == ["Fido", "Harleigh", "Mali"])
check("first_three_dogs_without_each", first_three_dogs_without_each(awesome_dog_array) == ["Fido", "Harleigh", "Mali"])
check("reverse_case_dog_names", reverse_case_dog_names(awesome_dog_array) == ["fIDO", "hARLEIGH", "mALI", "tRIXIE", "sNOW", "vICTORY"])
check("sum_of_all_dog_name_lengths", sum_of_all_dog_name_lengths(awesome_dog_array) == 33)
check("dogs_with_long_names", dogs_with_long_names(awesome_dog_array) == [false, true, false, true, false, true])

