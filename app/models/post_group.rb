class PostGroup
  include ActiveModel::Model

  def initialize(group)
    @group = group
  end

  def size
    @group.size
  end

  def titles
    @group.map(&:title)
  end

  def persisted?
    true
  end

  class << self
    def load
      group = Post.order(:id).to_a
      new group
    end
  end

  def save
    @group.each do |p|
      p.title = 'Overwritten'
      p.save!
    end
  end
end
