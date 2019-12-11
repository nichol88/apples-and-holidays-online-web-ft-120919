require 'pry'
def second_supply_for_fourth_of_july(holiday_hash)
  # {
  #   :winter => {
  #     :christmas => ["Lights", "Wreath"],
  #     :new_years => ["Party Hats"]
  #   },
  #   :summer => {
  #     :fourth_of_july => ["Fireworks", "BBQ"]
  #   },
  #   :fall => {
  #     :thanksgiving => ["Turkey"]
  #   },
  #   :spring => {
  #     :memorial_day => ["BBQ"]
  #   }
  # }
  holiday_hash[:summer][:fourth_of_july][1]
end
def add_supply_to_winter_holidays(holiday_hash, supply)
  # add the second argument, which is a supply, to BOTH the
  # Christmas AND the New Year's arrays
  holiday_hash[:winter].each{ |hol, sups|
    sups << supply
  }
end
def add_supply_to_memorial_day(holiday_hash, supply)
  # add the second argument to the memorial day array
  holiday_hash[:spring][:memorial_day] << supply
end
def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  # code here
  holiday_hash[season][holiday_name] = supply_array
  # remember to return the updated hash
  holiday_hash
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
  holiday_hash.each{ |season, holidays|
    puts "#{normalize(season)}:"
    holidays.each{ |holiday, sups|
      puts "  #{normalize(holiday)}: #{sups.join(', ')}"
    }
  }
end
def normalize(sym)
  sym = sym.to_s.gsub("_", " ")
  sym = sym.split(" ").map{|e|
    e.capitalize
  }
  sym = sym.join(" ")
end

def all_holidays_with_bbq(holiday_hash)
  # return an array of holiday names (as symbols) where supply lists
  # include the string "BBQ"
  bbqs = []
  holiday_hash.each{ |season, hols|
    hols.each{ |hol, sups|
      if sups.include?("BBQ")
        bbqs.push(hol)
      end
    }
  }
  bbqs
end
