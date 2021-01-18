class CreateSongs < ActiveRecord::Migration[5.0]
  def change
    create_table :songs do |t|
      t.belongs_to :artist, foreign_key: true
      t.belongs_to :genre, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
