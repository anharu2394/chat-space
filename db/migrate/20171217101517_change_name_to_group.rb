class ChangeNameToGroup < ActiveRecord::Migration[5.1]
  def change

  def up
    change_column :groups, :name, :string, null: false
  end

  def down
    change_column :groups, :name, :string
  end
  end
end
