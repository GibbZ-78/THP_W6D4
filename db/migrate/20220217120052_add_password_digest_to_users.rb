class AddPasswordDigestToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :password_digest, :string      # JBV - 2022.02.17 - Ajout du password pour hashage via B-Crypt
  end
end
