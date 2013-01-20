class AddVisibilityToEvents < ActiveRecord::Migration
  def change
    add_column :events, :visibility, :string
  end
end
