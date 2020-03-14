class TasksController < ApplicationController
  def index
    @tasks = Task.all.order({ :created_at => :desc })

    render({ :template => "tasks/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")
    @task = Task.where({:id => the_id }).at(0)

    render({ :template => "tasks/show.html.erb" })
  end

  def create
    @task = Task.new
    @task.task_name = params.fetch("query_task_name")
    @task.body_description = params.fetch("query_body_description")
    @task.user_id = params.fetch("query_user_id")
    # @task.status_id = params.fetch("query_status_id")

    if @task.valid?
      @task.save
      redirect_to("/tasks", { :notice => "Task created successfully." })
    else
      redirect_to("/tasks", { :notice => "Task failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    @task = Task.where({ :id => the_id }).at(0)

    # @task.task_name = params.fetch("query_task_name")
    # @task.body_description = params.fetch("query_body_description")
    # @task.user_id = params.fetch("query_user_id")
    @task.status_id = params.fetch("query_status")

    if @task.valid?
      @task.save
      redirect_to("/tasks/#{@task.id}", { :notice => "Task updated successfully."} )
    else
      redirect_to("/tasks/#{@task.id}", { :alert => "Task failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    @task = Task.where({ :id => the_id }).at(0)

    @task.destroy

    redirect_to("/tasks", { :notice => "Task deleted successfully."} )
  end
end
