class MyHash
  define_method(:initialize) do
    @global_array = []
  end

  define_method(:store) do |key, value|
    @global_array.push(key, value)
  end

  define_method(:fetch) do |key|
    if @global_array.include?(key)
      @global_array[@global_array.index(key).+(1)]
    else
      "Not included in the set"
    end
  end
end
