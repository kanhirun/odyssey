require 'lib/book/comparable_by_value'

RSpec.describe 'ComparableByValue mixin' do
  let(:klass) do
    Class.new do
      include Book::ComparableByValue

      def initialize(foo, bar, baz)
        @foo = foo
        @bar = bar
        @baz = baz
      end
    end
  end

  describe '#as_value_object' do
    it 'returns a list of instance variable values' do
      subject = klass.new(1,2,3)

      list_of_ivars = subject.as_value_object

      expect(list_of_ivars).to match_array [1,2,3]
    end
  end

  describe '#==' do
    it 'compares objects by value' do
      expect(klass.new(1,2,3)).to eq klass.new(1,2,3)
      expect(klass.new(4,5,6)).not_to eq klass.new(1,2,3)
    end
  end
end
