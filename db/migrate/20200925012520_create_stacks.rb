class CreateStacks < ActiveRecord::Migration[6.0]
  def change
    create_table :stacks do |t|
      t.string :task, null:false
      t.integer :count, default:0
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
