class Author
  attr_accessor :name

  def initialize(name)
    self.name = name

  end

  def posts
    Post.all
  end

  def add_post(post)
    post.author = self
  end

  def add_post_by_title(title)
    new = Post.new(title)
    new.author = self
    Post.all << new
    new
  end

  def self.post_count
    Post.all.uniq.count { |post| post.author.is_a?(Author) }
  end
  
end
