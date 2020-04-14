class Admin::UsersController < ApplicationController
  before_action :set_target_user, only: %i[show edit update destroy]
  before_action :is_admin_user

  def index
    @users = User.all.includes(:tasks)
  end

  def new
    @user = User.new
  end

  def edit; end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to admin_users_path, notice: 'ユーザーを登録しました'
    else
      render :new
    end
  end

  def show
    @user = User.includes(:tasks).find(params[:id])
  end

  def update
    @user.update!(user_params)
    redirect_to admin_users_path, notice: "タスク#{@user.name}を変更しました"
  end

  def destroy
    @user.destroy
    redirect_to admin_users_path, notice: "タスク#{@user.name}を削除しました"
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :admin)
  end

  def set_target_user
    @user = User.find(params[:id])
  end

  def is_admin_user
    raise Forbidden unless current_user.admin?
  end
end
