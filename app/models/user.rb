class User < ActiveRecord::Base

  has_many :actions, class_name: "UserRepoAction"
  has_many :repos, through: :actions

  validates :github_access_token, uniqueness: true, presence: true

end
