class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    
    can [:read, :new, :create], Shelter
    can [:update], Shelter, user_id: user.id

    can [:new, :create, :update, :destroy], Animal, shelter: { user_id: user.id }
    can :index, Animal

  end
end
