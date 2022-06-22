class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string :title
      t.string :language
      t.date :published
      t.text :summary

      t.timestamps
    end
  end
end
