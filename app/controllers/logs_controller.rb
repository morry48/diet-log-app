class LogsController < ApplicationController
  before_action :authenticate_user!, except: [:intro_app]
  before_action :set_log, only: [:show, :edit, :update, :destroy]
  before_action :set_logs, only: [:index, :week_index]
  
  def index
    @sum_today_calorie  = @logs.where('start_time LIKE(?)', "#{Time.now.strftime('%Y-%m-%d')}%").sumkcal.to_i
    @sum_this_month_calorie = @logs.where('start_time LIKE(?)', "#{Time.now.strftime('%Y-%m')}%").sumkcal.to_i
    - params[:start_date]||= Date.today.strftime('%Y-%m-%d')
    @calorie_parameter = (100*(@sum_this_month_calorie - @sum_today_calorie.to_f) / (2120*(Time.now.day-1).to_f)).to_i  if Time.now.day != 1
    @count_month_days =  Date.parse(params[:start_date]).end_of_month.day
  end

  def week_index
    -params[:start_date]||= Date.today.strftime('%Y-%m-%d')
    @sum_today_calorie  = @logs.where('start_time LIKE(?)', "#{Time.now.strftime('%Y-%m-%d')}%").sumkcal.to_i
    @count_month_days =  Date.parse(params[:start_date]).end_of_month.day
  end

  def show
  end

  def new
    @log=Log.new
  end


  def create
    i = 0
    while params[:log][i.to_s.to_sym] != nil do
      @log=Log.new(log_params(i))
      @log.save!
      i = i + 1
    end
    if @log.save!
      redirect_to new_log_path ,notice: '食事管理登録をしました'
    else
      flash.now[:notice] = '食事情報を入力してください'
      render :new
    end
  end

  def edit
  end

  def update
    @log.update!(log_params(i))     if @log.user_id==current_user.id
    redirect_to edit_log_path ,notice: '食事管理情報を編集しました'
  end

  def destroy
    @log.destroy
    redirect_to root_path ,notice: '食事管理情報を削除しました'
  end

  def intro_app
  end

  private


  def log_params(i)
    params.require(:log).require(i.to_s.to_sym).permit(:name,:protein,:fat,:carbohydrate,:start_time).merge(user_id:current_user.id)
  end

  def set_log
    i=0
    @log=Log.find(params[:id])
  end

  def set_logs
    @logs =current_user.logs.all
  end





end
