class RemoveProfileIdFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :profile_id, :string
  end
end
