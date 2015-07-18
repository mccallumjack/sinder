class User < ActiveRecord::Base
  authenticates_with_sorcery! do |config|
    config.authentications_class = Authentication
  end

  has_many :actions, class_name: "UserRepoAction"
  has_many :repos, through: :actions

  has_many :authentications, :dependent => :destroy
  accepts_nested_attributes_for :authentications


  validates :github_user_id, uniqueness: true, presence: true

  def has_linked_github?
    authentications.where(provider: 'github').present?
  end

end
