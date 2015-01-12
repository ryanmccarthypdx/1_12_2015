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
    if self.volume().*(@weight).>(0)
      if @weight.>(80)
        if self.volume().>(30000)
          "Your package is too heavy AND too large to ship"
        else
          "Your package is too heavy to ship"
        end
      elsif self.volume().>(30000)
        "Your package is too large to ship"
      elsif self.volume().<(100) && @weight.<(1)
        "Our low flat-rate of $9.95"
      else
        vol_mass = self.volume().*(0.001)
        if vol_mass.>=(@weight)
          total_cost = vol_mass.*(10)
        else
          total_cost = @weight*(10)
        end
        "Your total cost to ship this package is $".+(total_cost.round(2).to_s())
      end
    else
      "Your package does not exist in this plane of being"
    end
  end

end
