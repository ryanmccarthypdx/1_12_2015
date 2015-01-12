class MyHash
  define_method(:initialize) do
    @key_array = []
    @value_array = []
  end

  define_method(:store) do |key, value|
    if @key_array.include?(key)
      @value_array[@key_array.index(key)] = value
    else
      @key_array.push(key)
      @value_array.push(value)
    end
  end

  define_method(:fetch) do |key|
    if @key_array.include?(key)
      @value_array[@key_array.index(key)]
    else
      "Not included in key set"
    end
  end
end
