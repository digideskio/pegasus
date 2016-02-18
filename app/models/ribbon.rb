class Ribbon < ActiveRecord::Base
  def mask_value
    Ribbon.pow id
  end

  def self.pow(value)
    (value + 1)**2
  end

  def self.from_mask_value(value)
    Ribbon.find((Math.log(value) / Math.log(2)).to_i)
  end

  def self.from_mask(mask)
    ribbons = []
    Ribbon.ids.each do |id|
      if mask & Ribbon.pow(id)
        ribbons.push id
      end
    end

    Ribbon.where(id: ribbons)
  end
end
