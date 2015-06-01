class Ability
    include CanCan::Ability

    def initialize(user)
        if user.nil?
            can :read, Project
        else
            can :manage, Project, :user_id => user.id
            can :manage, Reward, :project => { :user_id => user.id }
        end
    end
end
