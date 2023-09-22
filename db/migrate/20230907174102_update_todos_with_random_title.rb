class UpdateTodosWithRandomTitle < ActiveRecord::Migration[7.0]
  def change
    Todo.all.find_each do |todo|
      todo.update(title: Faker::Lorem.words(number: 2).join(" ").capitalize)
    end
  end
end
