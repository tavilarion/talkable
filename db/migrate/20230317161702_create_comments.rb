class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.text :content
      t.string :author, null: false
      t.belongs_to :parent, null: true, foreign_key: { to_table: :comments }
      t.belongs_to :project, null: false

      t.timestamps
    end
  end
end
