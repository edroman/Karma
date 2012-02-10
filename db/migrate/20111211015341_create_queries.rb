class CreateQueries < ActiveRecord::Migration
  def change
    create_table :queries do |t|
      t.integer :user_id
      t.text :question
      t.string :status, :default => 'open'
      t.integer :mentor_id

      t.timestamps
    end
  end
end
