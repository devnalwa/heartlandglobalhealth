class CreateConsortia < ActiveRecord::Migration[5.1]
  def change
    create_table :consortia do |t|
      t.string :name
      t.string :sub
      t.string :date
      t.string :time
      t.string :location

      t.timestamps
    end
  end
end
