class CreateNeeds < ActiveRecord::Migration
  def change
    create_table :needs do |t|
      t.integer :user_id
      t.text :body

      t.timestamps
    end
  end
end
