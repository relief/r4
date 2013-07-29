class UserRenren < ActiveRecord::Base
  validates :access_token, presence:true
  validates :user_id, presence: true
  belongs_to :user
end
