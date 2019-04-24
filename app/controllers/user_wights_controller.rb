class UserWightsController < ApplicationController
  def new
    @user_wight=UserWight.new
  end

  def create
    @user_wight = UserWight.new(user_wight_params)
    if @user_wight.save
      redirect_to new_user_wight_path ,notice: '体重登録をしました'
    else
      flash.now[:notice] = '体重情報を入力してください'
      render :new
    end
  end

  def edit
    @user_wight=UserWight.find(params[:id])
  end

  def update
    user_wight = UserWight.find(params[:id])
    if user_wight.user_id == current_user.id
      user_wight.update(user_wight_params)
    end
    redirect_to edit_user_wight_path(user_wight.id) , notice: '体重登録を編集しました'
  end

  def destroy
    user_wight = UserWight.find(params[:id])
    user_wight.destroy
    redirect_to root_path ,notice: '体重管理を削除しました'
  end

  private
  def user_wight_params
    params.require(:user_wight).permit(:wight,:start_time).merge(user_id: current_user.id)
  end

end
