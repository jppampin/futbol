class AddNameToMatches < ActiveRecord::Migration
  def change
    add_column :matches, :name, :string

  end
end
