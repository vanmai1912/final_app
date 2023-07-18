class CreateAlbums < ActiveRecord::Migration[7.0]
  def change
    create_table :albums do |t|
      t.string :name, :des
      t.boolean :is_active
      t.timestamps
    end
    add_reference :albums, :user
  end
end
