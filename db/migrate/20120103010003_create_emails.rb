class CreateEmails < ActiveRecord::Migration
  def change
    create_table :emails do |t|
      t.text :subject
      t.text :body_html
      t.text :body_plain
      t.boolean :opened
      t.boolean :link_clicked
      t.integer :sender_id
      t.integer :receiver_id
      t.integer :need_id
      t.timestamps
    end
  end
end
