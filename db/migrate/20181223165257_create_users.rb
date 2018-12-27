class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :type
      t.string :first_name
      t.string :last_name
      t.integer :age
      t.integer :salary
      t.string :level_of_education

      t.timestamps
    end
  end
end
