class CreateMembers < ActiveRecord::Migration[5.1]
  def change
    create_table :members do |t|
      t.references :group, foreign_key: true,null: false
      t.references :user, foreign_key: true, null: false
      t.timestamps
    end
  end
end
