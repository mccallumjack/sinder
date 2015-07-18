class UserRepoActions < ActiveRecord::Base
  belongs_to :user
  belongs_to :repo

  validates :status, presence: true
end
