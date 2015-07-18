class User < ActiveRecord::Base
  authenticates_with_sorcery!
  has_many :actions, class_name: "UserRepoAction"
  has_many :repos, through: :actions

  validates :github_user_id, uniqueness: true, presence: true
end
