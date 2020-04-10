# frozen_string_literal: true

class TasksController < ApplicationController
  def index
    @task = if params[:direction] == 'DESC'
              Task.page(params[:page]).per(15).where(user_id: current_user).order(deadline: 'DESC')
            else
              Task.page(params[:page]).per(15).where(user_id: current_user).order(deadline: 'ASC')
            end
  end

  def new
    @task = Task.new
  end

  def show
    @task = Task.find(params[:id])
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update!(task_params)
    redirect_to '/', notice: "タスク#{@task.name}を変更しました"
  end

  def create
    @task = Task.new(task_params.merge(user_id: current_user.id))
    if @task.save
      redirect_to '/', notice: "タスク#{@task.name}を登録しました"
    else
      flash.now[:notice] = 'エラーが発生しました'
      render :new
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to '/', notice: "タスク#{@task.name}を削除しました"
  end

  def search
    @task = Task.search(params[:search]).page(params[:page])
    render 'index'
  end

  private

  def task_params
    params.require(:task).permit(:name, :detail, :deadline, :progress, :priority)
  end
end
