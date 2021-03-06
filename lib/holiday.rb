require 'pry'

holiday_hash = {
  :winter => {
    :christmas => ["Lights", "Wreath"],
    :new_years => ["Party Hats"]
  },
  :summer => {
    :fourth_of_july => ["Fireworks", "BBQ"]
  },
  :fall => {
    :thanksgiving => ["Turkey"]
  },
  :spring => {
    :memorial_day => ["BBQ"]
  }
}

def second_supply_for_fourth_of_july(holiday_hash)
  # return the second element in the 4th of July array
  holiday_supplies[:summer][:fourth_of_july][1]
end

def add_supply_to_winter_holidays(holiday_hash, supply)
  # holiday_hash is identical to the one above
  # add the second argument, which is a supply, to BOTH the
  # Christmas AND the New Year's arrays
  holiday_hash[:winter].collect do |key, value|
    value << supply
    # puts value.inspect
  end
end

# add_supply_to_winter_holidays(holiday_hash, "supply")

def add_supply_to_memorial_day(holiday_hash, supply)
  # again, holiday_hash is the same as the ones above
  # add the second argument to the memorial day array
  holiday_hash[:spring][:memorial_day] << supply
end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  # code here
  # remember to return the updated hash
  holiday_hash[season][holiday_name] = supply_array
end

def all_winter_holiday_supplies(holiday_hash)
  # return an array of all of the supplies that are used in the winter season
  holiday_hash[:winter].values.flatten
end

def all_supplies_in_holidays(holiday_hash)
  # iterate through holiday_hash and print items such that your readout resembles:
  # Winter:
  #   Christmas: Lights, Wreath
  #   New Years: Party Hats
  # Summer:
  #   Fourth Of July: Fireworks, BBQ
  # etc.
  holiday_hash.collect do |season, day_value|
    puts season.to_s.capitalize + ":"
    day_value.collect do |holiday, supply_values|  
    holiday_string = holiday.to_s.capitalize
    while holiday_string.include? "_" do
      holiday_string = holiday_string.sub("_"," ")
      holiday_string = holiday_string.split.map(&:capitalize).join(' ')
    end
      puts "  " + holiday_string + ": " + supply_values.join(", ")
    end
  end
end

# all_supplies_in_holidays(holiday_hash)

def all_holidays_with_bbq(holiday_hash)
  # return an array of holiday names (as symbols) where supply lists
  # include the string "BBQ"
  the_array = []
  holiday_hash.each do |season, day_value|
    day_value.collect do |holiday, supply_value|
      the_array << holiday if supply_value.include?("BBQ")
    end
  end
  the_array
end

# all_holidays_with_bbq(holiday_hash)





