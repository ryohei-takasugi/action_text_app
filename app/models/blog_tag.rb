class BlogTag
  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :title, :string
  attribute :tag, :string

  with_options presence: true do
    validates :title
    validates :content
  end

  def initialize(attributes = {})
    @blog = set_blog(title: attributes[:title], content: attributes[:content])
    super(attributes)
  end

  def content
    @blog.content
  end

  def content=(content_body)
    @blog = set_blog
    @blog.content = content_body
  end

  def save
    return false unless valid?
    blog = Blog.create(title: title, content: content)
    unless tag.nil?
      record = Tag.where(name: tag).first_or_initialize
      record.save
      BlogTagRelation.create(tag_id: record.id, blog_id: blog.id)
    end
  end

  # def find(params_id)
  #   blog = Blog.find(params_id)
  #   blog.tag = blog.tags.map { |t| t.name }.join("")
  # end

  def update(attributes = {})
    return false unless valid?
    binding.pry
    @blog.update(title: attributes[:title], content: attributes[:content])
    unless tag.nil?
      record = Tag.where(name: tag).first_or_initialize
      record.save
      BlogTagRelation.create(tag_id: record.id, blog_id: blog.id)
    end
  end

  private

  def set_blog(attributes = {})
    Blog.new(attributes)
  end
end
