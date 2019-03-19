class CreateRainbows < ActiveRecord::Migration[5.2]
  def change
    create_table :rainbows do |t|
      t.text :sentence
      t.text :explain
      t.timestamps
    end
  end
end
