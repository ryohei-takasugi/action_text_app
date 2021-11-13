class BlogTagsController < ApplicationController
  before_action :set_blog, only: [:show, :destroy]
  before_action :set_blog_tag, only: [:edit, :update]

  # GET /blogs
  def index
    @blogs = Blog.all.with_rich_text_content_and_embeds
  end

  # GET /blogs/1
  def show
  end

  # GET /blogs/new
  def new
    @blog = BlogTag.new
  end

  # GET /blogs/1/edit
  def edit
    binding.pry
  end

  # POST /blogs
  def create
    @blog = BlogTag.new(blog_params)
    if @blog.save
      redirect_to @blog, notice: 'Blog was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /blogs/1
  def update
    if @blog.update(blog_params)
      redirect_to @blog, notice: 'Blog was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /blogs/1
  def destroy
    @blog.destroy
    redirect_to blogs_url, notice: 'Blog was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blog
      @blog = Blog.find(params[:id])
    end

    def set_blog_tag
      blog = Blog.find(params[:id])
      @blog = BlogTag.new(
        title: blog.title,
        content: blog.content
        tag: blog.tags.map { |t| t.name }.join("")
      )
      # binding.pry
      # @blog = BlogTag.find_form_obj(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def blog_params
      params.require(:blog_tag).permit(:content, :tag, :title)
    end
end
