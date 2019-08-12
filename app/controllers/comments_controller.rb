class CommentsController < ApplicationController
  def create

    @rainbow = Rainbow.find(params[:rainbow_id])

    @comment = @rainbow.comments.create(comment_params)

    redirect_to rainbow_path(@rainbow)

  end



  private

  def comment_params

    params.require(:comment).permit(:user, :content)

  end
end
