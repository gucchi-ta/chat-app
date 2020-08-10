class UsersController < ApplicationController
  def edit
  end

  def update
    current_user.update(user_params)      #編集内容が更新されるように、コントローラーを編集
    if current_user.update(user_params)   #ユーザー情報の更新に成功した場合、チャット画面に遷移するように実装
      redirect_to root_path
    else
      render :edit      #更新に失敗するとeditページに戻ってくるよう実装
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
