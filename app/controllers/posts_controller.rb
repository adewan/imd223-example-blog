class PostsController < ApplicationController
  load_and_authorize_resource
  before_filter :authenticate_user!, :except => [:index, :show]

  def index
  end

  def show
  end

  def new
  end

  def create

    if @post.save
      redirect_to post_path(@post), :notice => 'Post was successfully created.'
    else
      render :action => "new"
    end
  end

  def edit
  end

  def update
    if @post.update_attributes(params[:post])
      redirect_to post_path(@post), :notice => 'Post was successfully updated.'
    else
      render :action => "edit"
    end
  end


  def destroy
    @post.destroy

    redirect_to posts_path, :notice => 'Post was deleted'
  end
end

