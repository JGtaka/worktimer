class TasksController < ApplicationController

  before_action :authenticate_user!

  def index
  end

  def new
    @task = Task.new
  end

end
