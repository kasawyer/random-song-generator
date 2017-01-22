class Outcomes < ActiveRecord::Migration[5.0]
  def up
    create_table :tracks do |t|
      t.string :artist, null: false
      t.string :album, null: false
      t.string :track, null: false
      t.string :art
      t.string :streaming

      t.timestamps null: false
    end

    create_table :outcomes do |t|
      t.integer :track_id, null: false
      t.integer :user_id
      t.boolean :win, default: false

      t.timestamps null: false
    end

    create_table :users do |t|
      t.string :provider, null: false
      t.string :uid, null: false
      t.string :username, null: false
      t.string :email
    end
  end

  def down
    drop_table :users
    drop_table :tracks
    drop_table :outcomes
  end
end
