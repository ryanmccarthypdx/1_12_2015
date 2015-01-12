require('rspec')
require('hash_maker')

describe(MyHash) do
  describe("#fetch") do
    it("retrieves a stored value by its key") do
      test_hash = MyHash.new()
      test_hash.store("kitten", "cute")
      expect(test_hash.fetch("kitten")).to(eq("cute"))
    end

    it("won't retrieve anything if not included in set") do
      test_hash = MyHash.new()
      test_hash.store("kitten", "cute")
      expect(test_hash.fetch("dog")).to(eq("Not included in key set"))
    end

    it("works with multiple keys and values") do
      test_hash = MyHash.new()
      test_hash.store("kitten", "cute")
      test_hash.store("puppy", "cuter")
      test_hash.store("duckling", "cutest")
      expect(test_hash.fetch("puppy")).to(eq("cuter"))
    end

    it("excludes values from the key-search") do
      test_hash = MyHash.new()
      test_hash.store("kitten", "cute")
      test_hash.store("puppy", "cuter")
      test_hash.store("duckling", "cutest")
      expect(test_hash.fetch("cutest")).to(eq("Not included in key set"))
    end

    it("replaces values when keys are re-entered") do
      test_hash = MyHash.new()
      test_hash.store("kitten", "cute")
      test_hash.store("kitten", "cuter")
      test_hash.store("duckling", "cutest")
      expect(test_hash.fetch("kitten")).to(eq("cuter"))
    end

  end
end
