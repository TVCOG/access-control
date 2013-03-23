class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.integer :card_id
      t.integer :site_code
      t.boolean :enabled
      t.references :user

      t.timestamps
    end
    add_index :cards, :user_id
  end
end
