class Subscription < ApplicationRecord
    belongs_to :user
    belongs_to :subforum
    validates :user_id, uniqueness: { scope: :subforum_id,
    message: "user should have max of one subscription per subforum" }
end
