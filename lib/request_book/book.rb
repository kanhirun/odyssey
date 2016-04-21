require_relative 'comparable_by_value'

class Book
  include ComparableByValue

  attr_accessor :title, :author, :url

  def initialize(title:, author:, url: '')
    @title  = title
    @author = author
    @url    = url
  end
end
