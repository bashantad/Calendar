class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :events, :visibility, :circle_id
  end
end
