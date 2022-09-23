class CreateCoins < ActiveRecord::Migration[7.0]
  def change
    create_table :coins do |t|
      t.string :name
      t.string :price_usd

      t.timestamps
    end
  end
end
