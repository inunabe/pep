require "csv"
periods_csv = CSV.readlines("db/periods.csv")
periods_csv.shift
periods_csv.each do |row|
  Period.create(title: row[1],start_date: row[2],finish_date: row[3])
end
