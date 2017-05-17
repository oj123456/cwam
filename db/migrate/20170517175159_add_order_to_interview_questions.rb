class AddOrderToInterviewQuestions < ActiveRecord::Migration[5.0]
  def change
    add_column :interview_questions, :order, :integer, default: 0
  end
end
