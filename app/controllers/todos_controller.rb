class TodosController < ApplicationController
  def new
    @todo = Todo.new
  end

  def create
    @todo = Todo.create(allowed_params)
    if @todo.save
        redirect_to :action => "index", :controller=>"pages"
    else
        redirect_to new_todo_path, alert: "Error creating todo."
    end
  end

  def allowed_params
    params.require(:todo).permit(:tasks, :finished)
  end

end
