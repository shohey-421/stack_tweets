class AddUnitToStacks < ActiveRecord::Migration[6.0]
  def change
    add_column :stacks, :unit, :string , null:false
  end
end
