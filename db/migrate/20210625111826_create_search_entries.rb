class CreateSearchEntries < ActiveRecord::Migration[6.1]
  def change
    create_table :search_entries do |t|
      t.string :title
      t.text :body
      t.references :searchable, polymorphic: true, null: false

      t.timestamps
    end
  end
end
