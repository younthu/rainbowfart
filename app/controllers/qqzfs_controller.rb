class QqzfsController < InheritedResources::Base

  def index

    # @q = Qqzf.ransack(params[:q])
    # @qqzfs = @q.result()

    a = Qqzf.all
    a.instance_eval do
      def total_count
        3876341
      end
    end
    @qqzfs = a.page(params[:page]).per(25)
  end
end
