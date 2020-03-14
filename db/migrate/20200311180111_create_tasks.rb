class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.text :task_name
      t.string :body_description
      t.integer :user_id
      t.integer :status_id

      t.timestamps
    end
  end
end
