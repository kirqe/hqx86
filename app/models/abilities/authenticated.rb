module Abilities
  class Authenticated
    include CanCan::Ability

    def initialize(user)
      can [:create], [Build, Comment]
      can [:read, :update], Build, user_id: user.id
      can [:update], User, id: user.id  #should probably be updated later
    end
  end
end

