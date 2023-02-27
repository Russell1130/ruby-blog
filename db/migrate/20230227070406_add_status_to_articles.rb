class AddStatusToArticles < ActiveRecord::Migration[7.0]
  def change
    add_column :articles, :status, :string
  end
end
