class LogsController < ApplicationController
  before_action :authenticate_user!, except: [:intro_app]
  
  def index
    @logs =current_user.logs.all
    @sum_this_month_calorie = current_user.logs.where('start_time LIKE(?)', "#{Time.now.strftime('%Y-%m')}%").sumkcal.to_i
    @sum_today_calorie  = current_user.logs.where('start_time LIKE(?)', "#{Time.now.strftime('%Y-%m-%d')}%").sumkcal.to_i
    @sum_month_calorie = current_user.logs.where('start_time LIKE(?)', "#{request.fullpath.delete("/?start_date=").gsub(/(.{3})$/, '')}%").sumkcal.to_i
    - params[:start_date]||= Date.today.strftime('%Y-%m-%d')
    @count_month_days =  Date.parse(params[:start_date]).end_of_month.day
    @calorie_parameter = (100*(@sum_this_month_calorie - @sum_today_calorie.to_f) / (2120*(Time.now.day-1).to_f)).to_i
  end

  def week_index
    @logs =current_user.logs.all
    -params[:start_date]||= Date.today.strftime('%Y-%m-%d')
    @sum_today_calorie  = current_user.logs.where('start_time LIKE(?)', "#{Time.now.strftime('%Y-%m-%d')}%").sumkcal.to_i
    @count_month_days =  Date.parse(params[:start_date]).end_of_month.day
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
