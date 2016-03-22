class CreateExams < ActiveRecord::Migration
  def change
    create_table :exams do |t|
      t.references :student, index: true, foreign_key: true
      t.string :english
      t.string :integer
      t.integer :hindi
      t.integer :math
      t.integer :science
      t.integer :social

      t.timestamps null: false
    end
  end
end
