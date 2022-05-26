class Item < ApplicationRecord
    validates :title, presence: true
    validates :description, presence: true

    belongs_to :user

    def completed?
        !completed_at.blank?
    end
end
