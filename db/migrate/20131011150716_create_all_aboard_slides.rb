class CreateAllAboardSlides < ActiveRecord::Migration
  def change
    create_table :all_aboard_slides do |t|
      t.references :board, index: true
      t.integer :position

      t.timestamps
    end
  end
end
