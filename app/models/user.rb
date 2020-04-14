class User < ApplicationRecord
  before_destroy :must_not_last_one_user
  has_secure_password
  has_many :tasks, dependent: :destroy

  private

  def must_not_last_one_user
    # 　adminユーザーが一人のみ、かつ削除しているuserがadminユーザーの場合削除できない
    throw(:abort) if User.where('admin = true').count == 1 && admin?
  end
end
