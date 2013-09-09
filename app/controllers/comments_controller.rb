class CommentsController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    @comment = @user.comments.create(params[:comment].permit(:commenter, :body))
    redirect_to user_path(@user)
  end
end
