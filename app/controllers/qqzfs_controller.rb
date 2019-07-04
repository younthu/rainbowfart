class QqzfsController < InheritedResources::Base

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
end
