class Actor < ActiveRecord::Base
  def roles
    return Role.where(:actor_id => self.id)
  end
end
