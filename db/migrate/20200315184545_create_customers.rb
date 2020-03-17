class CreateCustomers < ActiveRecord::Migration[6.0]
  def change
    create_table :customers do |t|
      t.belongs_to :user, foreign_key: true
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :address
      t.string :unit
      t.string :city
      t.string :state
      t.string :zip

      t.timestamps
    end
  end
end
