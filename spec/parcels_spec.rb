require('rspec')
require('parcels')
require('pry')

describe(Parcel) do
  describe("#volume") do
    it("returns an error when nothing is inputted") do
      test_parcel = Parcel.new(0,0,0,0)
      expect(test_parcel.volume()).to(eq(0))
    end

    it("returns the volume") do
      test_parcel = Parcel.new(2,2,2,0)
      expect(test_parcel.volume()).to(eq(8))
    end

    it("returns the volume rounded to the nearest 0.0x when inputs are floats") do
      test_parcel = Parcel.new(2,4.3798,5.999999,0)
      expect(test_parcel.volume()).to(eq(52.56))
    end
  end

  describe("#cost_to_ship") do
    it("returns an error when any of the values is entered as zero") do
      test_parcel = Parcel.new(2,2,2,0)
      expect(test_parcel.cost_to_ship()).to(eq("Your package does not exist in this plane of being"))
    end

    it("returns the flat rate when volume is under 100 sq inches and less than half a pound") do
      test_parcel = Parcel.new(2,2,24,0.4)
      expect(test_parcel.cost_to_ship()).to(eq("Our low flat-rate of $9.95"))
    end

    it("returns an error message when the package is too unwieldy for our folks to handle") do
      test_parcel = Parcel.new(400,400,400,1)
      expect(test_parcel.cost_to_ship()).to(eq("Your package is too large to ship"))
    end

    it("returns an error message when the package is too heavy for our folks to handle") do
      test_parcel = Parcel.new(1,1,1,1000)
      expect(test_parcel.cost_to_ship()).to(eq("Your package is too heavy to ship"))
    end

    it("returns an error message when the package is too heavy AND too unwieldy for our folks to handle") do
      test_parcel = Parcel.new(400,400,400,1000)
      expect(test_parcel.cost_to_ship()).to(eq("Your package is too heavy AND too large to ship"))
    end

    it("returns the calculated price based on the inputted weight") do
      test_parcel = Parcel.new(10,10,10,10)
      expect(test_parcel.cost_to_ship()).to(eq("Your total cost to ship this package is $100.0"))
    end

    it("returns the calculated price based on the volume-mass for light but large packages") do
      test_parcel = Parcel.new(20,20,20,1)
      expect(test_parcel.cost_to_ship()).to(eq("Your total cost to ship this package is $80.0"))
    end

  end

end
