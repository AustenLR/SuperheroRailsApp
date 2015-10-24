class CreateSuperheros < ActiveRecord::Migration
  def change
    create_table :superheros do |t|
      t.string :name
      t.string :image_url
      t.references :user

      t.timestamps null: false
    end
  end
end
