require 'test_helper'

describe PostGroup, :model do
  it "must use the db transaction in tests" do
    self.class.ancestors.must_include ActiveSupport::TestCase
  end

  describe :load do
    it 'should load posts' do
      group = PostGroup.load
      group.size.must_equal 2
      group.titles.must_equal ['Second Post', 'First Post']
    end
  end

  describe :save do
    it 'should overwrite titles' do
      PostGroup.load.save
      Post.all.each do |p|
        p.title.must_equal 'Overwritten'
      end
    end
  end
end
