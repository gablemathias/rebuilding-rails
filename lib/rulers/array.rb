class Array
  # Checking

  def deeply_empty?
    empty? || all?(&:empty?)
  end

  # Accessing

  def to(num)
    self.length > num ? self[..num] : []
  end

  def from(num)
    self.length > num ? self[num..] : []
  end

  # Manipulating

  def including(*elements)
    self + elements.flatten(1)
  end

  def extract!
    return to_enum(:extract!) { size } unless block_given?

    extracted_elements = []

    self.reject! do |element|
      extracted_elements.append(element) if yield(element)
    end

    extracted_elements
  end
end
