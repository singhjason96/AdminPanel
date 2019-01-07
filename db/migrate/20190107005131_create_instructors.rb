class CreateInstructors < ActiveRecord::Migration[5.2]
  def change
    create_table :instructors do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.integer :age
      t.integer :salary
      t.string :level_of_education
      t.references :cohort, foreign_key: true

      t.timestamps
    end
  end
end
