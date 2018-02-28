# require "csv"
# question_alternatives_csv = CSV.readlines("db/question_alternatives.csv")
# question_alternatives_csv.shift
# question_alternatives_csv.each do |row|
#   QuestionAlternative.create(text: row[1], question_id: row[2])


equire "csv"
departments_csv = CSV.readlines("db/departments.csv")
departments_csv.shift
departments_csv.each do |row|
  Department.create(name: row[1])

# equire "csv"
# grades_csv = CSV.readlines("db/grades.csv")
# grades_csv.shift
# grades_csv.each do |row|
#   Grade.create(department_id: row[1],rank: row[2])

end
