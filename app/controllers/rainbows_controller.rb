class RainbowsController < InheritedResources::Base


  def index
    @q = Rainbow.ransack(params[:q])
    @rainbows = @q.result(distinct: true)
  end

  private

    def rainbow_params
      params.require(:rainbow).permit(:sentence)
    end
end

