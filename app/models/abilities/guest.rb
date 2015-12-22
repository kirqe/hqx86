module Abilities
  class Guest
    include CanCan::Ability

    def initialize(user)
      can :read, [Build, Comment, Post, Showcase], published: true
    end
  end
end