class Repo < ActiveRecord::Base
  has_many :actions, class_name: "UserRepoAction"
  has_many :users, through: :actions
end
