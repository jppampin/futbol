class AddRequireConfirmationToMatches < ActiveRecord::Migration
  def change
    add_column :matches, :require_confirmation, :boolean

  end
end
