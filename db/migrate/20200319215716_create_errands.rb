class CreateErrands < ActiveRecord::Migration[6.0]
  def change
    create_table :errands do |t|
      t.belongs_to :customer, null: false, foreign_key: true
      t.integer :status, null: false, default: 0
      t.string :short_description, null: false
      t.text :full_description

      t.timestamps
    end
  end
end
