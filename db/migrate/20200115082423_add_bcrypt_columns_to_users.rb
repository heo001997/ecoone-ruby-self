class AddBcryptColumnsToUsers < ActiveRecord::Migration[6.0]
  def change
    # Please learn and understand more about queries & syntax of this kind of migration
    add_column :user, :password_digest, :string
  end
end