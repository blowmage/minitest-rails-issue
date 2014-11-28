require 'test_helper'

describe Post do
  describe :load do
    it 'should load a fixture' do
      posts(:one).title.must_equal 'First Post'
    end
  end
end
