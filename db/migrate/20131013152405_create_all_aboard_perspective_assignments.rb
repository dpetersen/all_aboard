class CreateAllAboardPerspectiveAssignments < ActiveRecord::Migration
  def change
    create_table :all_aboard_perspective_assignments do |t|
      t.string :template_id
      t.integer :column
      t.integer :row
      t.references :slide, index: true

      t.timestamps
    end
  end
end
