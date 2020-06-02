class RubyIdentifier
  def initialize
  end

  # add : String, String ->
  # Records a person and whether they love Ruby
  def add(name, loves_ruby)
    raise NotImplementedError
  end

  # ruby_haters : -> Array
  # Returns the people who don't love Ruby
  def ruby_haters()
    raise NotImplementedError
  end

  # delete_the_haters : Array ->
  # Deletes people in the names array who don't like Ruby
  def delete_the_haters(names)
    raise NotImplementedError
  end

  # get_everyone : -> Array
  # Returns an array of all the people
  def get_everyone()
    raise NotImplementedError
  end
end
