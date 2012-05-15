class CommentsController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show, :find_post]
	before_filter :find_post

  def index
    @comments = @post.comments
  end

  def show
    @comment = @post.comments.find( params[:id] )
  end

  def new
    @comment = @post.comments.build
    authorize! :new, @comment
  end

  def create
    @comment = @post.comments.build(params[:comment])
    authorize! :create, @comment

    if @comment.save
      redirect_to post_comment_path(@post, @comment), :notice => 'Post was successfully created.'
    else
      render :action => "new"
    end
  end

  def edit
    @comment = @post.comments.find( params[:id] )
    authorize! :edit, @comment
  end

  def update
    @comment = @post.comments.find(params[:id])
    authorize! :update, @comment

    if @comment.update_attributes(params[:comment])
      redirect_to post_comment_path(@post, @comment), :notice => 'Post was successfully updated.'
    else
      render :action => "edit"
    end
  end


  def destroy
    @comment = @post.comments.find(params[:id])
    authorize! :destroy, @comment

    @comment.destroy

    redirect_to post_comments_path(@post), :notice => 'Post was deleted'
  end

  def find_post
  	@post = Post.find(params[:post_id])
    authorize! :read, @post
  end
end
