class RemoveUserFromQuestion < ActiveRecord::Migration[5.1]
  def change
    remove_column :questions, :user_id, :integer
  end
end
