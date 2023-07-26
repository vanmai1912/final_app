class CreateAlbumsPhotos < ActiveRecord::Migration[7.0]
  def change
    create_table :albums_photos do |t|
      t.belongs_to :photo
      t.belongs_to :album
      t.timestamps
    end
  end
end
