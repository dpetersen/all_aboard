class CreateAllAboardConfigurableAttributeValues < ActiveRecord::Migration
  def change
    create_table :all_aboard_configurable_attribute_values do |t|
      t.string :configurable_attribute_id
      t.string :value

      t.timestamps
    end
  end
end
