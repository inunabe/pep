class AddRateToQuestionAlternatives < ActiveRecord::Migration
  def change
    add_column :question_alternatives, :rate, :integer
  end
end
