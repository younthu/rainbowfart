class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string :user
      t.text :content

      t.timestamps
    end
  end
end
