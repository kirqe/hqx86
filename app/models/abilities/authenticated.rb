module Abilities
  class Authenticated
    include CanCan::Ability

    def initialize(user)
      can [:create], [Build, Comment]
      can [:read, :update], Build, user_id: user.id
#      can [:read, :update], Post, user_id: user.id
      can :update, User do |u|
         u.id == user.id
      end
    end
  end
end
