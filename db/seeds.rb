require "csv"
grades_csv = CSV.readlines("db/grades.csv")
grades_csv.shift
grades_csv.each do |row|
  Grade.create(department_id: row[1],rank: row[2])

end
