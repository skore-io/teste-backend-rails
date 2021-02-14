class CreateContents < ActiveRecord::Migration[5.0]
  def change
    create_table :contents do |t|
      t.string :name
      t.integer :duration
      t.string :provider
      t.string :media_type
      t.string :provider_id
      t.datetime :expires_at
      t.boolean :watched
      t.boolean :expired

      t.timestamps
    end
  end
end
