module Abilities
  class Guest
    include CanCan::Ability

    def initialize(user)
      can :read, [Build, Comment, Post], published: true
    end
  end
end