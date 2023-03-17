class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      t.string :name, null: false
      t.text :description
      t.integer :status, default: 0, limit: 1

      t.timestamps
    end
  end
end
