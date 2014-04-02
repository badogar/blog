class CommentsController < ApplicationController

	  def create
	    @post = Post.find(params[:post_id])
	    @comment = @post.comments.create(params[:comment].permit(:commenter, :body))
	    flash[:message] = "New comment has been added."
	    redirect_to post_path(@post)
	  end

	  def destroy
	  	@post = Post.find(params[:post_id])
	  	@comment = @post.comments.find(params[:id])
	  	@comment.destroy
	  	flash[:notice] = "Comment has been deleted."
	  	redirect_to post_path(@post)
	  end
end
