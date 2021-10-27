class Blog < ApplicationRecord
  has_rich_text :content
  validates :tag, presence: true
end
