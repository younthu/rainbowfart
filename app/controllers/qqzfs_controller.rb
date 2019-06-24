class QqzfsController < InheritedResources::Base

  def index

    # @q = Qqzf.ransack(params[:q])
    # @qqzfs = @q.result()

    @qqzfs = Qqzf.all.page(params[:page]).per(25)
  end
end
