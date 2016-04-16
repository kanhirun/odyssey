require 'lib/book'

RSpec.describe Book, type: :unit do
  it 'behaves like a Value object' do
    expect(Book.new(title: 'X', author: 'Y')).to eq Book.new(title: 'X', author: 'Y')
    expect(Book.new(title: 'X', author: 'Y')).not_to eq Book.new(title: 'ZZZZ', author: 'ZZZZ')
  end
end
