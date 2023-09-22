class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :todos, dependent: :destroy
  has_many :accountability_relationships, class_name: "Relationship", foreign_key: "overlord_id", dependent: :destroy
  has_many :overseen_todos, through: :accountability_relationships, source: :overseen_todo

  def overlord_of(overseen_todo)
    overseen_todos << overseen_todo unless overseen_todo.user == self
  end

  def overlord_of?(overseen_todo)
    overseen_todos.include?(overseen_todo)
  end

  def remove_as_overlord_of(overseen_todo)
    overseen_todos.delete(overseen_todo)
  end
end
