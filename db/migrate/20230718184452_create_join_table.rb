class CreateJoinTable < ActiveRecord::Migration[7.0]
  def change
    create_join_table :Photos, :Albums do |t|
      t.index [:photo_id, :album_id]
      t.index [:album_id, :photo_id]
    end
  end
end
