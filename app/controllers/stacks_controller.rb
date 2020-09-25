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

  private
  def task_params
    params.require(:stack).permit(:task).merge(user_id: current_user.id)
  end
end
