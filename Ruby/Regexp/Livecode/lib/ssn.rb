require('date')
require ('yaml')

SSN_REGEXP = /(?<gender>[12]) (?<birth_year>\d{2}) (?<month>0[1-9]|1[0-2]) (?<department>0[1-9]|[1-9][0-9]) (\d{3} ){2}\d{2}/

def ssn_key_is_valid?(ssn)
  snn_without_key = ssn[..-3].gsub(" ", '').to_i
  key = ssn[-2..].to_i
  return (97 - snn_without_key) % 97 == key
end

def ssn_valid?(ssn)
  return ssn.match?(SSN_REGEXP) && ssn_key_is_valid(ssn)
end

def gender_from(ssn_gender)
  ssn_gender = ssn_gender.to_i
  return "man" if ssn_gender == 1
  return "woman" if ssn_gender == 2
  return "unknown"
end

def month_from(ssn_month)
  ssn_month = ssn_month.to_i
  Date::MONTHNAMES[ssn_month]
end

def department_from(ssn_department)
  departments = YAML.load_file('data/d.yml')
  departments[ssn_department]
end

def year_from(ssn_year)
  ssn_year = ssn_year.to_i
  return "#{(Date.today.year-100).to_s[0..1]}#{ssn_year}" if ssn_year > Date.today.strftime("%y").to_i
  return "#{(Date.today.year).to_s[0..1]}#{ssn_year}" if ssn_year <= Date.today.strftime("%y").to_i
end

def french_ssn_info(ssn)
  return "The number is invalid" unless ssn_valid?(ssn)
  match_data = ssn.match(SSN_REGEXP)
  return "a #{gender_from(match_data[:gender])}, born in #{month_from(match_data[:month])}, #{year_from(match_data[:birth_year])} in #{department_from(match_data[:department])}."
end

p year_from("45") == "1945"
p year_from("20") == "2020"
p gender_from("1") == "man"
p gender_from("2")  == "woman"
p ssn_valid?('123') == false
p ssn_valid?('1 84 12 76 451 089 46') == true
p french_ssn_info("1 84 12 76 451 089 46") == "a man, born in December, 1984 in Seine-Maritime."
p french_ssn_info("123") == "The number is invalid"
