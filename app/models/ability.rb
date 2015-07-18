class Ability
  include CanCan::Ability

  def initialize(user)
    self.merge Abilities::Everyone.new(user)

    if user
      self.merge Abilities::Admin.new(user) if user.admin?
      self.merge Abilities::Authenticated.new(user)
    else
      self.merge Abilities::Guest.new(user)
    end
  end
end

# can [:read,:create], [Build, Comment]
# can [:read, :update], Build, user_id: user.id
# can [:update], User, id: user.id  #should probably be updated later
# can [:read], [Post, Build], published: true
# can [:read], User, admin: false