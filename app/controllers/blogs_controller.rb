class BlogsController < ApplicationController
  before_filter :authorize, except: [:index, :show]
  #show all the blogs in db
  def index
    @blogs = Blog.all
    render :index
  end

  #form to create new blog
  def new
    @blog = Blog.new
    render :new
  end

  # creates new blog in db
  # that Belongs_to current_user
  def create
    blog = current_user.blog.create(blog_params)
    redirect_to blog_path(blog)
  end

  def show
    @blog = Blog.find(params[:id])
    render :show
  end

  def edit
    @blog = Blog.find(params[:id])
    if current_user.blog.include? @blog
      render :edit
    else
      redirect_to profile_path
    end
  end

  def update
    blog = Blog.find(params[:id])
    if current_user.blog.include? blog
      blog.update_attributes(blog_params)
      redirect_to blog_path(blog)
    else
      redirect_to profile_path
    end
  end 

  def destroy
    @blog = Blog.find(params[:id])
    if current_user.blog.include? @blog
      @blog.destroy
      redirect_to profile_path, :notice => "Sucessfully Deleted"
    else
      redirect_to root_path
    end
  end

  private
  def blog_params
    params.require(:blog).permit(:title, :content)
  end


end
