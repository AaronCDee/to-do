class TodosController < ApplicationController
    def index
        @page = params.key?("page") ? params[:page].to_i : 1
        number_of_records = 10
        @todos = Todo.all.order(created_at: :desc).includes(:user).limit(number_of_records).offset((@page - 1)*number_of_records)
    end
    
    def show
        @todo = Todo.find(params[:id])
        puts @todo
    end

    def new
        @todo = Todo.new
    end
    
    def create
        @user = User.first
        @todo = @user.todos.new(todo_params)
        if @todo.save
            respond_to do |format|
                format.html { redirect_to @todo }
                format.turbo_stream
            end
        else
            render :new, status: :unprocessable_entity
        end
    end

    def edit
        @todo = Todo.find(params[:id])
    end

    def update
        @todo = Todo.find(params[:id])
        if @todo.update(todo_params)
            redirect_to @todo
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @todo = Todo.find(params[:id])
        @todo.destroy
        respond_to do |format|
            format.turbo_stream { render turbo_stream: turbo_stream.remove(@todo) }
            format.html         { redirect_to todos_url }
        end
    end

    private
    
        def todo_params
            params.require(:todo).permit(:title, :description, :deadline, :complete)
        end
end
