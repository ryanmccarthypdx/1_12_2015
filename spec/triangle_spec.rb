require('rspec')
require('triangle')

describe(Triangle) do
  describe('#triangle_check') do
    it("Returns an error if it is not a triangle") do
      test_triangle = Triangle.new(8,2,1)
      expect(test_triangle.triangle_check()).to(eq("This is not a triangle!"))
    end

    it("recognizes equilateral triangles") do
      test_triangle = Triangle.new(2,2,2)
      expect(test_triangle.triangle_check()).to(eq("This is an equilateral triangle"))
    end

    it("recognizes isosceles triangles") do
      test_triangle = Triangle.new(3,3,5)
      expect(test_triangle.triangle_check()).to(eq("This is an isosceles triangle"))
    end

    it("ignores negative values") do
      test_triangle = Triangle.new(3,-3,5)
      expect(test_triangle.triangle_check()).to(eq("This is an isosceles triangle"))
    end

    it("recognizes scalene triangles") do
      test_triangle = Triangle.new(3,4,5)
      expect(test_triangle.triangle_check()).to(eq("This is a scalene triangle"))
    end

    it("returns and errror message if any of the sides is zero") do
      test_triangle = Triangle.new(3,4,0)
      expect(test_triangle.triangle_check()).to(eq("This is not a triangle!"))
    end
  end
end
