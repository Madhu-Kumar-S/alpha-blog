class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    # to create table in schema
    # create_table :table_name
    create_table :articles do |t|
      t.string :title
      t.text :description
    end
  end
end
