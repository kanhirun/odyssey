FactoryGirl.define do
  factory :book do
    transient do
      title 'My Title'
      author 'My Author'
    end

    initialize_with do
      Book.new(title: title, author: author)
    end
  end
end
