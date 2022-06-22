class Checkouts < ActiveRecord::Migration[6.1]
  def change
    create_table :checkouts do |t|
      t.belongs_to :patron
      t.belongs_to :book
      t.date :issue_date
      t.date :return_date
    end
  end
end
