class CreateRelationships < ActiveRecord::Migration[8.1]
  def change
    create_table :relationships do |t|
      t.references :follower, null: false, foreign_key: true
      t.references :follwed, null: false, foreign_key: true

      t.timestamps
    end
  end
end
