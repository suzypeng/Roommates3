class StatusesController < ApplicationController
  def index
    @statuses = Status.all.order({ :created_at => :desc })

    render({ :template => "statuses/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")
    @status = Status.where({:id => the_id }).at(0)

    render({ :template => "statuses/show.html.erb" })
  end

  def create
    @status = Status.new
    @status.status = params.fetch("query_status")

    if @status.valid?
      @status.save
      redirect_to("/statuses", { :notice => "Status created successfully." })
    else
      redirect_to("/statuses", { :notice => "Status failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    @status = Status.where({ :id => the_id }).at(0)

    @status.status = params.fetch("query_status")

    if @status.valid?
      @status.save
      redirect_to("/statuses/#{@status.id}", { :notice => "Status updated successfully."} )
    else
      redirect_to("/statuses/#{@status.id}", { :alert => "Status failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    @status = Status.where({ :id => the_id }).at(0)

    @status.destroy

    redirect_to("/statuses", { :notice => "Status deleted successfully."} )
  end
end
