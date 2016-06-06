class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :url
      t.string :title
      t.boolean :read

      t.timestamps null: false
    end
  end
end
