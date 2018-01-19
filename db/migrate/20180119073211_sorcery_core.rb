class SorceryCore < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email,            :null => false
      t.string :crypted_password
      t.string :salt
      t.string :name
      t.integer :role
      t.integer :department_id
      t.integer :superior_id

      t.timestamps                :null => false
    end

    add_index :users, :email, unique: true
  end
end
