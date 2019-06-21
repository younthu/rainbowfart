class RainbowsController < InheritedResources::Base


  def index
    @q = Rainbow.ransack(params[:q])
    @rainbows = @q.result(distinct: true)

    @rainbows = @rainbows.order('created_at DESC').page(params[:page]).per(25)
  end

  private

    def rainbow_params
      params.require(:rainbow).permit(:sentence)
    end
end

