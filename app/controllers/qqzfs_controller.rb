class QqzfsController < InheritedResources::Base

  def index

    @q = Qqzf.ransack(params[:q])
    @qqzfs = @q.result()

    @qqzfs = @qqzfs.page(params[:page]).per(25)
  end
end
