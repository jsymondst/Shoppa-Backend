class AddUrlindexToLists < ActiveRecord::Migration[6.0]
  def change
    add_column :lists, :urlindex, :string
  end
end
