class Photo < ApplicationRecord
    belongs_to :user
    has_and_belongs_to_many :albums
    mount_uploader :image, ImageUploader
    serialize :images, JSON
end
