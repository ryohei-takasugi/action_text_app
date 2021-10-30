class Blog < ApplicationRecord
  has_rich_text :content1
  has_rich_text :content2
  validates :tag, presence: true
end
