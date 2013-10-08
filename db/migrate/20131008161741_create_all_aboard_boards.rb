class CreateAllAboardBoards < ActiveRecord::Migration
  def change
    create_table :all_aboard_boards do |t|
      t.string :name

      t.timestamps
    end
  end
end
