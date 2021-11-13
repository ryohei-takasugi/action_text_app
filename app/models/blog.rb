class Blog < ApplicationRecord
  has_rich_text :content
  has_one :content, class_name: 'ActionText::RichText', as: :record, dependent: :destroy
  has_many :blog_tag_relations
  has_many :tags, through: :blog_tag_relations
  validates :title, presence: true
end
