class RemoveTagToActionTextRichTexts < ActiveRecord::Migration[6.0]
  def change
    remove_column :action_text_rich_texts, :tag, :integer
  end
end
