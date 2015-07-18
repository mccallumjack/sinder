class UserRepoAction < ActiveRecord::Base
  belongs_to :user
  belongs_to :repo

  validates :status, presence: true
end
