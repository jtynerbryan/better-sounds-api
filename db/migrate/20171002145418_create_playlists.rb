class CreatePlaylists < ActiveRecord::Migration[5.1]
  def change
    create_table :playlists do |t|
      t.string :spotify_id
      t.integer :user_id
    end
  end
end
