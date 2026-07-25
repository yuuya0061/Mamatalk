class ChangeColumnToBigInt < ActiveRecord::Migration[8.1]
  def change
    change_column :posts , :user_id, :bigint
    change_column :sessions , :user_id, :bigint
  end
end
