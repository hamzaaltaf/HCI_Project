class Event < ActiveRecord::Base
    belongs_to :user
    has_many :participants
    mount_uploader :image, ImageUploader
    serialize :categories
    serialize :skills
    
    def organizer_details(e)
        id = e.user_id
        return User.find(id)
    end

end
