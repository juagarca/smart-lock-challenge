class AddAccessTokenToServer < ActiveRecord::Migration[6.0]
  def change
    add_column :servers, :access_token, :string
  end
end
