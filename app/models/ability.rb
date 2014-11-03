class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    
    can [:read], Shelter
    can [:update, :read], Shelter, user_id: user.id

    can [:manage], Animal, shelter: { user_id: user.id }
    can :index, Animal

  end
end
