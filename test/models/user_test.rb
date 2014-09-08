require_relative '../test_helper'

class UserTest < ActiveSupport::TestCase
  test "has an avatar" do
    user = users(:user_with_avatar)
    assert File.exists?(user.avatar.file.path)
  end

  test "uploads an avatar" do
    user = User.create!(avatar: fixture_file_upload('/files/tapir.jpg', 'image/jpg'))
    assert File.exists?(user.reload.avatar.file.path)
  end

  test "removes an avatar" do
    user = User.create!(avatar: fixture_file_upload('/files/tapir.jpg', 'image/jpg'))
    user.avatar.remove!
    assert !File.exists?(user.reload.avatar.file.path)
  end
end
