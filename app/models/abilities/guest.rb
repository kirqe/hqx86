module Abilities
  class Guest
    include CanCan::Ability

    def initialize(user)
      can :read, [Build, Post], published: true
      can :read, Comment
      can :read, Showcase
      can :read, User #, admin: false
    end
  end
end