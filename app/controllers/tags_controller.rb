class TagsController < ApplicationController
  load_and_authorize_resource
  before_filter :authenticate_user!, :except => [:index, :show, :find_post]
	before_filter :find_post, :except => [:show]

  def create
    @tag = @post.tags.build(params[:tag])

    if @tag.save
      redirect_to post_path(@post), :notice => 'Tag was successfully created.'
    else
      render :action => "new"
    end
  end

  def show
  	@tag = Tag.find(params[:id])
  end

  def update
    @tag = @post.tags.find(params[:id])

    if @tag.update_attributes(params[:tag])
      redirect_to post_path(@post), :notice => 'Tag was successfully updated.'
    else
      render :action => "edit"
    end
  end

  def destroy
    @tag = @post.tags.find(params[:id])

    @tag.destroy

    redirect_to post_path(@post), :notice => 'Tag was deleted'
  end

  def find_post
  	if params[:post_id]
  		@post = Post.find(params[:post_id])
      authorize! :read, @post
  	end
  end
end
