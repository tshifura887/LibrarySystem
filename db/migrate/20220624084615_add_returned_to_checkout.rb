class AddReturnedToCheckout < ActiveRecord::Migration[6.1]
  def change
    add_column :checkouts, :returned, :boolean, default: false
  end
end
