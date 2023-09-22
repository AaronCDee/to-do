class Todo < ApplicationRecord
    belongs_to :user
    has_many :accountability_relationships, class_name: "Relationship", 
                                            foreign_key: "overseen_todo_id", 
                                            dependent: :destroy
    
    has_many :overlords, through: :accountability_relationships, source: :overlord

    validates :description, presence: true
    validates :title, presence: true


    def has_overlord(overlord)
        overlords << overlord unless overlord == self.user
    end

    def has_overlord?(overlord)
        overlords.include?(overlord)
    end

    def remove_overlord(overlord)
        overlords.delete(overlord)
    end
end
