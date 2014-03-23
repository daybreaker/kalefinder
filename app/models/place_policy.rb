class PlacePolicy
  attr_accessor :user, :place

  def initialize(user, place)
    @user = user
    @place = place
  end

  # Complex permissions
  def index?
    @user.admin?
  end

  def create?
    @user.admin?
  end

  def show?
    @user.admin?
  end

  def edit?
    @user.admin?
  end

  def destroy?
    @user.admin?
  end

  def update?
    @user.admin?
  end
end
