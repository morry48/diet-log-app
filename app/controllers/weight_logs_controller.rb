class WeightLogsController < ApplicationController
  def new
    @weight_log = WeightLog.new
  end

  def create
    @weight_log = WeightLog.new(weight_log_params)
    if @weight_log.save
      redirect_to new_weight_log_path ,notice: '体重登録をしました'
    else
      flash.now[:notice] = '体重情報を入力してください'
      render :new
    end      
  end


  def edit
    @weight_log = WeightLog.find(params[:id])
  end

  def update
    weight_log = WeightLog.find(params[:id])
    if weight_log.user_id == current_user.id
      weight_log.update(weight_log_params)
    end
    redirect_to root_path , notice:'体重登録を編集しました'
  end

  def destroy
    weight_log= WeightLog.find(params[:id])
    weight_log.destroy
    redirect_to root_path ,notice:'体重管理を削除しました'
  end

  private
  def weight_log_params
    params.require(:weight_log).permit(:weight,:start_time).merge(user_id: current_user.id)
  end


end
