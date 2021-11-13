class CreateBlogTagRelations < ActiveRecord::Migration[6.0]
  def change
    create_table :blog_tag_relations do |t|
      t.references :tag,  null: false, foreign_key: true
      t.references :blog, null: false, foreign_key: true
      t.timestamps
    end
  end
end
