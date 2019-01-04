class CreateCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :courses do |t|
      t.string :name
      t.time :start_time
      t.time :end_time
      t.references :cohort, foreign_key: true


      t.timestamps
    end
  end
end
