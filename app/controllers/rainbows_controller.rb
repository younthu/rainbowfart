class RainbowsController < InheritedResources::Base
  add_breadcrumb "首页", :root_path
  add_breadcrumb "彩虹屁", :rainbows_path

  def index
    if params[:poision].present?
      @q = Rainbow
    else
      @q = Rainbow.ransack(params[:q])
    end

    @rainbows = @q.result(distinct: true)

    @rainbows = @rainbows.order('id DESC').page(params[:page]).per(25)
  end

  def poison

    @q = Rainbow.poisonous_soup.ransack(params[:q])
    @rainbows = @q.result(distinct: true)

    @rainbows = @rainbows.order('id DESC').page(params[:page]).per(25)

    render :index
  end

  # 随机生成一句话, 返回json, 只包含彩虹屁，不包含励志语句
  def random
    rainbow = Rainbow.all.sample
    ahoy.track "Random rainbowfart", title: "#{rainbow.sentence}"

    @rainbow = rainbow
    render "show.json"
  end

  def show
    @rainbow = Rainbow.find params[:id]
    @prev = Rainbow.where("id < ?", params[:id]).order(id: :desc).limit(1)&.[](0)
    @next = Rainbow.where("id > ?", params[:id]).limit(1)&.[](0)
  end

  def collections
    # ActsAsTaggableOn::Tag
    @collections = ActsAsTaggableOn::Tagging.includes(:tag).where(context: 'collections', taggable_type: :Rainbow).map{|t| t.tag}.uniq
  end

  def report
    # 随机拼report

    # @report = []
    # 10.times do |t|
    #   r = Rainbow.find Random.rand(Rainbow.count)
    #   @report << r.sentence
    # end
    @report = Rainbow.all.sample(10)

  end

  def collection
    collection_id = params[:id]
    name  = ActsAsTaggableOn::Tag.find(collection_id).name
    @name = name

    @rainbows = Rainbow.tagged_with(name)

  end
  private

    def rainbow_params
      params.require(:rainbow).permit(:sentence,:collections)
    end
end

