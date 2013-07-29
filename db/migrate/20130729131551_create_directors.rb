class CreateDirectors < ActiveRecord::Migration
  def change
    create_table :directors do |t|
      t.string :name
      t.string :dob
      t.string :image_url
      t.text :bio
    end
  end
end
