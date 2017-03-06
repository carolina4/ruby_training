require 'rails_helper'

describe Comment, type: :model do
  
    let(:comment) { Comment.new() }

    it { expect(comment).to validate_uniqueness_of :link }
end
