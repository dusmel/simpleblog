class PagesController < ApplicationController
  def index
    @allPosts = Page.all
  end
  def new
      @onePost = Page.new
  end
  def create
    @onePost = Page.new(post_params)
    if(@onePost.save)
      redirect_to @onePost
    else
      render 'new'
    end
  end
  def show
    @onePost = Page.find(params[:id])
    @cat = params[:idss]
    @wedding = nil
    @birthday = nil
    @funeral = nil

    if @cat == "wedding"
      @wedding = 'selected'
    elsif @cat == "birthday"
      @birthday = "selected"
    elsif @cat = "funeral"
      @funeral = "selected"
    end
  end
  def edit
    @onePost = Page.find(params[:id])
  end
  def update
    @onePost = Page.find(params[:id])
    if(@onePost.update(post_params))
      redirect_to @onePost
    else
      render 'edit'
    end
  end
  def destroy
    @onePost = Page.find(params[:id])
    @onePost.destroy
    redirect_to pages_path
  end


  private def post_params
    params.require(:form_post).permit(:title, :body)
  end
end
