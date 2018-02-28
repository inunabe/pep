equire "csv"
departments_csv = CSV.readlines("db/departments.csv")
departments_csv.shift
departments_csv.each do |row|
  Department.create(name: row[1])

end
