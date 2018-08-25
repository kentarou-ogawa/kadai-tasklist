class TasksController < ApplicationController
   def index
    @tasks = tasks.all
  end

   def show
    @tasks = tasks.find(params[:id])
  end

  def new
    @tasks = tasks.new
  end


  

  def edit
  end

  def update
  end

  def destroy
  enddef create
    @tasks = tasks.new(tasks_params)

    if @tasks.save
      flash[:success] = 'tasks が正常に投稿されました'
      redirect_to @tasks
    else
      flash.now[:danger] = 'tasks が投稿されませんでした'
      render :new
    end
  end

  def edit
    @tasks = tasks.find(params[:id])
  end

  def update
  end

  
  def destroy
    @tasks = tasks.find(params[:id])
    @tasks.destroy

    flash[:success] = 'tasks は正常に削除されました'
    redirect_to tasks_url
  end

  
  def update
    @tasks = tasks.find(params[:id])

    if @tasks.update(v_params)
      flash[:success] = 'tasks は正常に更新されました'
      redirect_to @tasks
    else
      flash.now[:danger] = 'tasks は更新されませんでした'
      render :edit
    end
  end

  
  def create
    @tasks = tasks.new(tasks_params)

    if @tasks.save
      flash[:success] = 'tasks が正常に投稿されました'
      redirect_to @message
    else
      flash.now[:danger] = 'tasks が投稿されませんでした'
      render :new
    end
  end

  private
  def tasks_params
    params.require(:tasks).permit(:content)
  end
end
