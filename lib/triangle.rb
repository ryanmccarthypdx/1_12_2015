class Triangle
  define_method(:initialize) do |a,b,c|
    triangle_array = [(a.to_f().abs()), (b.to_f().abs()), (c.to_f().abs())]
    @sorted_array = triangle_array.sort()
    @a = @sorted_array[0]
    @b = @sorted_array[1]
    @c = @sorted_array[2]
  end

  define_method(:triangle_check) do
    if @c.<(@b.+(@a)) && (@a.*(@b).*(@c) != 0)
      if @b == @a && @b == @c
          "This is an equilateral triangle"
      elsif @b == @a || @b == @c
          "This is an isosceles triangle"
      else
        "This is a scalene triangle"
      end
    else
      "This is not a triangle!"
    end

  end
end
