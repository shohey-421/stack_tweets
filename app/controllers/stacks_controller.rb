class StacksController < ApplicationController


  def index
    @stack = Stack.new
    if user_signed_in?
      @stacks = Stack.where(user_id: current_user.id)
    end
  end

  def create
    stack =  Stack.new(task_params)
    if stack.save
      redirect_to root_path
    else
      render :index
    end
  end

  def update
    @stack = Stack.find(params[:id])
    @stack.update(count_up_params)
    if @stack.valid?
      respond_to do |format|
        format.json { render json: { task: @stack.task, count: @stack.count, unit: @stack.unit, user_id: @stack.user_id, id: @stack.id } }
      end
    end
  end

  def edit
    stack = Stack.find(params[:id])
    
    if stack.update(task_params)
      redirect_back(fallback_location: root_path)
    end
  end

  private
  def task_params
    params.require(:stack).permit(:task,:unit).merge(user_id: current_user.id)
  end

  def count_up_params
    count = @stack[:count]
    update_params = today_params
    count_sum = update_params[:count].to_i + count.to_i
    update_params[:count] = count_sum.to_s
    return update_params
  end

  def today_params
    params.require(:stack).permit(:count)
  end
end
