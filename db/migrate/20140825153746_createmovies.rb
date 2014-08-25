class Createmovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :name, null: false
      t.integer :year, null: false
      t.string :synopsis, null: false
    end
  end
end
