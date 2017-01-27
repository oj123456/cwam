class CreateInterviewQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :interview_questions do |t|
      t.string :title
      t.string :description
      t.integer :interview_id

      t.timestamps
    end
  end
end
