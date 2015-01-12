class Parcel
  define_method(:initialize) do |length, width, height, weight|
    @length = length
    @width = width
    @height = height
    @weight = weight
  end

  define_method(:volume) do
    @length.*(@width).*(@height).round(2)
  end

  define_method(:cost_to_ship) do
    if self.volume().*(@weight).!=(0)
      if self.volume().<=(100)
        "Our low flat-rate of $9.95"
      elsif self.volume().>(30000)
        "Your package is too large to ship"
      elsif @weight.>(80)
        "Your package is too heavy to ship"
      else
        vol_mass = self.volume().*(0.005)
        if vol_mass.>=(@weight)
          total_cost = vol_mass.*(20)
        else
          total_cost = @weight*(20)
        end
        "Your total cost to ship this package is ".+(total_cost.to_s)
      end
    else
      "Your package does not exist in this plane of being"
    end
  end

end
