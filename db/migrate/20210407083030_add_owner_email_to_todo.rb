class AddOwnerEmailToTodo < ActiveRecord::Migration[6.1]
  def change
    add_column :todos, :owner_email, :string
  end
end
