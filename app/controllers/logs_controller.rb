class LogsController < ApplicationController
  def index
    @logs =Log.all
  end

  def week_index
    @logs=Log.all
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

  def show
    @log=Log.find(params[:id])
  end

  def edit
    @log=Log.find(params[:id])
  end



  def update
    log = Log.find(params[:id])
    log.update(log_params)
    redirect_to edit_log_path ,notice: '食事管理情報を削除しました。'
  end

  def destroy
    log = Log.find(params[:id])
    log.destroy
    redirect_to root_path ,notice: '食事管理情報を削除しました。'
  end

  private
  def log_params
    params.require(:log).permit(:name,:protein,:fat,:carbohydrate,:start_time)
  end
end
