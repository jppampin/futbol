class AddMatchToPlayers < ActiveRecord::Migration
  def change
    add_column :players, :match_id, :integer

  end
end
