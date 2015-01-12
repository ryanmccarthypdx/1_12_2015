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


  end

end
