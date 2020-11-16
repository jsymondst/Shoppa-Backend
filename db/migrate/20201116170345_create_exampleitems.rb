class CreateExampleitems < ActiveRecord::Migration[6.0]
  def change
    create_table :exampleitems do |t|
      t.string :name
      t.string :category
      t.boolean :usersubmitted, default:false

      t.timestamps
    end
  end
end
