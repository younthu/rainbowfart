class YijuzisController < InheritedResources::Base
  add_breadcrumb "首页", :root_path
  add_breadcrumb "精美句子", :yijuzi_path

  def index
    a = Yijuzi.all
    a.instance_eval do
      def total_count
        Rails.cache.fetch("yijuzi_total_count", expires_in: 240.hours) do
          Yijuzi.count
        end
      end
    end
    @yijuzis = a.page(params[:page]).per(25)
  end
end
