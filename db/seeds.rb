require "csv"
questions_csv = CSV.readlines("db/questions.csv")
questions_csv.shift
questions_csv.each do |row|
  Question.create(text: row[1],weight: row[4])
end
