class CreateUserComments < ActiveRecord::Migration[5.2]
  def change
    create_table :user_comments do |t|
      t.string :user
      t.text :content
      t.references :rainbow, foreign_key: true

      t.timestamps
    end
  end
end
