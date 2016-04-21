class Book
  module ComparableByValue
    def ==(other_book)
      self.as_value_object == other_book.as_value_object
    end

    def as_value_object
      instance_variables.map{ |ivar| instance_variable_get(ivar) }
    end
  end
end
