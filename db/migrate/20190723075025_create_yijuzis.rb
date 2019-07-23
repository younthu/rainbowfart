class CreateYijuzis < ActiveRecord::Migration[5.2]
  def change
    create_table :yijuzis do |t|
      t.string :category1
      t.string :category2
      t.string :title
      t.string :url
      t.string :content

      t.timestamps
    end
  end
end
