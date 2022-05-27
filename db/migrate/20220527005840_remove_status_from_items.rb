class RemoveStatusFromItems < ActiveRecord::Migration[7.0]
  def change
    remove_column :items, :status, :boolean
  end
end
