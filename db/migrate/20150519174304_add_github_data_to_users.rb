class AddGithubDataToUsers < ActiveRecord::Migration
  def change
    add_column :users, :email, :string
    add_column :users, :github_access_token, :string
  end
end
