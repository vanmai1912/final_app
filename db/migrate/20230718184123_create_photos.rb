class CreatePhotos < ActiveRecord::Migration[7.0]
  def change
    create_table :photos do |t|
      t.string :name, :url, :des
      t.boolean :is_active
      t.timestamps
      
    end
    add_reference :photos, :user
  end
end
