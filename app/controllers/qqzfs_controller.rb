class QqzfsController < InheritedResources::Base
  add_breadcrumb "首页", :root_path
  add_breadcrumb "名言警句", :myjj_path

  def index

    # @q = Qqzf.ransack(params[:q])
    # @qqzfs = @q.result()

    a = Qqzf.all
    a.instance_eval do
      def total_count
        Rails.cache.fetch("qqzf_total_count", expires_in: 240.hours) do
          Qqzf.count
        end
      end
    end
    @qqzfs = a.page(params[:page]).per(25)
  end

  def show

  end
end
