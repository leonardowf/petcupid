class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    
    can [:read], Shelter
    can [:update, :read], Shelter, user_id: user.id

    can [:manage], Animal, shelter: { user_id: user.id }
    can :index, Animal

    can [:manage], Photo do |photo|
      resource = photo.parent
      owner = resource.user_owner
      puts "owner_id: #{owner.id} ||| user.id: #{user.id}"

      if (owner.id == user.id)
        true
      end
    end
  end
end
