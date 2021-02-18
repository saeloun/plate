# frozen_string_literal: true

class CreateTodos < ActiveRecord::Migration[6.1]
  def change
    create_table :todos, id: :uuid do |t|
      t.string :title
      t.boolean :status

      t.timestamps
    end
  end
end
