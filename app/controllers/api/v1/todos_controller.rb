class Api::V1::TodosController < Api::V1::BaseController
    def index
        @todos = Todo.all
        render json: @todos, status: :ok
    end
end