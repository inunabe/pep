require "csv"

users_csv = CSV.readlines("db/users.csv")
users_csv.shift
users_csv.each do |row|
  User.create(email: row[1], crypted_password: row[2], salt: row[3], name: row[4])
end
