class Album < ApplicationRecord
    has_and_belongs_to_many :photos
    belongs_to :user
end
