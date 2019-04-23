class LogsController < ApplicationController
  before_action :authenticate_user!, except: [:intro_app]
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
      flash.now[:notice] = '食事情報を入力してください'
      render :new
    end
  end

  def show
    @log=Log.find(params[:id])
  end

  def edit
    @log=Log.find(params[:id])
  end

  def intro_app
  end


  def update
    log = Log.find(params[:id])
    log.update(log_params)     if log.user_id==current_user.id
    redirect_to edit_log_path ,notice: '食事管理情報を編集しました'
  end

  def destroy
    log = Log.find(params[:id])
    log.destroy
    redirect_to root_path ,notice: '食事管理情報を削除しました'
  end

  private
  def log_params
    params.require(:log).permit(:name,:protein,:fat,:carbohydrate,:start_time).merge(user_id: current_user.id)
  end
end
