class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :provider
      t.string :uid
      t.string :name
      t.binary :image
      t.string :email
      t.string :member
      t.string :token
      t.string :secret
      t.timestamps
    end
  end
end
