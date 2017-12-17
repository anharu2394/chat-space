class RemoveNameToUser < ActiveRecord::Migration[5.1]
  def change
    remove_reference :groups, :user, foreign_key: true
  end
end
