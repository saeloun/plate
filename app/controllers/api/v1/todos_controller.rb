# frozen_string_literal: true

class Api::V1::TodosController < ApplicationController
  def index
    todos = Todo.order("created_at DESC")
    render json: todos
  end

  def create
    todo = Todo.create(todo_param)
    render json: todo
  end

  def update
    todo = Todo.find(params[:id])
    todo.update(todo_param)
    render json: todo
  end

  def destroy
    todo = Todo.find(params[:id])
    todo.destroy
    head :no_content, status: :ok
  end

  def demo
    @greeting = "Home action says: Hello world!"
  end

  private
    def todo_param
      params.require(:todo).permit(:id, :title, :status)
    end
end
