class Ribbon < ActiveRecord::Base

  def mask_value
    id ** 2
  end
end
