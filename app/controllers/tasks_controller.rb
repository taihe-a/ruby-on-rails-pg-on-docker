class TasksController < ApplicationController
  def index
    @task = Task.all.order(created_at: :desc)
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
    redirect_to "/" ,notice:"タスク#{@task.name}を変更しました"
  end
  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to "/" ,notice:"タスク#{@task.name}を登録しました"
    else
      flash.now[:notice] = '10文字以上入力してください'
      render :new
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to "/" ,notice:"タスク#{@task.name}を削除しました"
  end
  private

  def task_params
    params.require(:task).permit(:name, :details)
  end
  
end
