class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.integer :user_id
      t.boolean :confirm
      t.boolean :cancel
      t.decimal :score

      t.timestamps
    end
  end
end
