class RainbowsController < InheritedResources::Base


  def index
    @q = Rainbow.ransack(params[:q])
    @rainbows = @q.result(distinct: true)

    @rainbows = @rainbows.order('id DESC').page(params[:page]).per(25)
  end

  def show
    @rainbow = Rainbow.find params[:id]
    @prev = Rainbow.where("id < ?", params[:id]).order(id: :desc).limit(1)&.[](0)
    @next = Rainbow.where("id > ?", params[:id]).limit(1)&.[](0)
  end

  def collections
    @collections = ActsAsTaggableOn::Tagging.includes(:tag).where(context: 'collections', taggable_type: :Rainbow).uniq
  end

  private

    def rainbow_params
      params.require(:rainbow).permit(:sentence,:collections)
    end
end

