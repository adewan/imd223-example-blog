class Ability
  include CanCan::Ability

  def initialize(user)
    
    user ||= User.new

    if user.admin?
      can :manage, :all
    else
      can :read, :all
    end

    unless user.guest?
        can :create, Post
        can :manage, Post, :user_id => user.id

        # anyone can create comments
        can :create, Comment

        # I can edit/delete comments I wrote
        can :manage, Comment, :user_id => user.id

        # I can edit/delete comments on my posts
        can :manage, Comment, :post => { :user_id => user.id }
    end

    # comments & tags
  end
end
