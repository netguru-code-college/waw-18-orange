class CreatePayments < ActiveRecord::Migration[5.2]
  def change
    create_table :payments do |t|
      t.decimal :amount, precision: 9, scale: 2
      t.boolean :paid, default: false
      t.belongs_to :user, index: true
      t.belongs_to :group, index: true

      t.timestamps
    end
  end
end
