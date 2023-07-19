class Photo < ApplicationRecord
    belongs_to :user
    has_and_belongs_to_many :albums
    has_one_attached :image
end
