class UserCommentsController < ApplicationController
  def create

    @rainbow = Rainbow.find(params[:rainbow_id])

    @comment = @rainbow.user_comments.create(comment_params)

    redirect_to rainbow_path(@rainbow)

  end



  private

  def comment_params

    params.require(:user_comment).permit(:user, :content)

  end
end
