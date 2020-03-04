class CreateCartJoiners < ActiveRecord::Migration[6.0]
  def change
    create_table :cart_joiners do |t|
      t.belongs_to :cart, null: false, foreign_key: true
      t.belongs_to :item, null: false, foreign_key: true
      t.integer :quantity, default: 1

      t.timestamps
    end
  end
end