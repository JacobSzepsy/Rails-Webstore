class ChangePriceToIntegerInItems < ActiveRecord::Migration[6.1]
  def up
    change_column :items, :cost, :integer
  end

  def down
    change_column :items, :cost, :string
  end
end
