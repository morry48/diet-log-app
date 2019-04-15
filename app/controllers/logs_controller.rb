class LogsController < ApplicationController
  def index
  end

  def new
    @log=Log.new
  end

  def create
    @log = Log.new(log_params)
    if @log.save
      redirect_to new_log_path ,notice: '食事管理登録をしました'
    else
      flash.now[:alert] = '食事情報を入力してください'
      render :new
    end
  end

  private
  def log_params
    params.require(:log).permit(:name,:protein,:fat,:carbohydrate)
  end
end
