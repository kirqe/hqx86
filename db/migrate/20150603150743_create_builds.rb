class CreateBuilds < ActiveRecord::Migration
  def change
    create_table :builds do |t|
      t.string :b_type
      t.string :name
      t.string :spec
      t.string :mb
      t.string :cpu
      t.string :gpu
      t.string :ram
      t.string :disk
      t.string :chassis
      t.decimal :cost
      t.string :os
      t.string :im
      t.string :status
      t.text :body

      t.timestamps null: false
    end
  end
end
