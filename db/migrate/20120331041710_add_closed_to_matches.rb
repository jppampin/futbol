class AddClosedToMatches < ActiveRecord::Migration
  def change
    add_column :matches, :closed, :boolean

  end
end
