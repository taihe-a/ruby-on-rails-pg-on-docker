class TasksController < ApplicationController
  def index
    if params[:direction] == 'DESC'
      @task = Task.page(params[:page]).per(15).order(deadline: "DESC")
    else
      @task = Task.page(params[:page]).per(15).order(deadline: "ASC")
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

  def search
    @task = Task.search(params[:search]).page(params[:page])
    render 'index'
  end
  

  private

  def task_params
    params.require(:task).permit(:name, :detail, :deadline, :progress, :priority)
  end

end
