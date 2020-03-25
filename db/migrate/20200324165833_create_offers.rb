class CreateOffers < ActiveRecord::Migration[6.0]
  def change
    create_table :offers do |t|
      t.belongs_to :errand, null: false, foreign_key: true
      t.belongs_to :volunteer, null: false, foreign_key: true
      t.integer :status, null: false, default: 0, index: true
      t.text :message
      t.datetime :accepted_at

      t.timestamps
    end
  end
end
