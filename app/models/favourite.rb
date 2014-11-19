class Favourite < ActiveRecord::Base
  belongs_to :user
  belongs_to :image, counter_cache: true

  validates :user_id, uniqueness: {scope: :image_id}
  validates :user, presence: true
  validates :image, presence: true

end
