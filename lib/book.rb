require_relative 'book/comparable_by_value'

class Book
  include ComparableByValue

  attr_reader :title, :author, :url

  def initialize(title:, author:, url: '')
    @title  = title
    @author = author
    @url    = url
  end
end
