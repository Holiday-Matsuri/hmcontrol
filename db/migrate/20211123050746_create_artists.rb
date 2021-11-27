class CreateArtists < ActiveRecord::Migration[6.1]
  def change
    create_table :artists do |t|
      t.string :artist_name
      t.string :artist_location
      t.references :convention, null: false, foreign_key: true

      t.timestamps
    end
  end
end
