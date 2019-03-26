# frozen_string_literal: true

class CreateContacts < ActiveRecord::Migration[6.0]
  def change
    create_table :contacts, id: :uuid, force: :cascade do |t|
      t.string :name
      t.string :email, null: false
      t.text :message

      t.timestamps
    end
  end
end
