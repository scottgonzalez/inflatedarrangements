class CreateCustomerMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :customer_messages do |t|
      t.string :name
      t.string :email
      t.string :subject
      t.text :message

      t.timestamps
    end
  end
end
