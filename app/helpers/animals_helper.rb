module AnimalsHelper
  def animal_age(dob)
    time_ago_in_words(dob)
  end
end
