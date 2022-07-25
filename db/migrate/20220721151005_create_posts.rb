class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.date :stday
      t.date :endday
      t.string :shujitsu
      t.string :memo

      t.timestamps
    end
  end
end
