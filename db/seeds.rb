require "csv"

question_alternatives_csv = CSV.readlines("db/question_alternatives.csv")
question_alternatives_csv.shift
question_alternatives_csv.each do |row|
  Question_alternative.create(text: row[1], question_id: row[2])
end
