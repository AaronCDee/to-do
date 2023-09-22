class Relationship < ApplicationRecord
    belongs_to :overlord, class_name: "User"
    belongs_to :overseen_todo, class_name: "Todo"
end
