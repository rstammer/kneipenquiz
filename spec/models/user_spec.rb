require 'spec_helper'

describe User do
  context 'with validations' do
    it 'allows only two users' do
      User.delete_all
      robin = User.new(email: "foo@bar.baz", password: "boobasfaDfdfs")
      robin.save!
      axl = User.new(email: "foo2@bar.baz", password: "boobasfaDfdfs")
      axl.save!

      expect(User.count).to eql 2
      visitor = User.new(email: "blorgh@blurgh.blargh", password: "sdfjsljlkskjsds")
      expect(visitor).not_to be_valid
    end
  end
end
