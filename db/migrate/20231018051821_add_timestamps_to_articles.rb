class AddTimestampsToArticles < ActiveRecord::Migration[7.0]
  def change
    # to add column in schema
    # add_column :table_name, :attribute_name, :datatype
    add_column :articles, :created_at, :datetime
    add_column :articles, :updated_at, :datetime
  end
end
