require "csv"

companies_csv = CSV.readlines("db/users.csv")
companies_csv.shift
companies_csv.each do |row|
  Company.create(email: row[1], crypted_password: row[2], salt: row[3], name: row[4])
end
