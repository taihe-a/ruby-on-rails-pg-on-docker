class User < ApplicationRecord
  before_destroy :must_not_last_one_user
  has_secure_password
  has_many :tasks, dependent: :destroy

  private

  def must_not_last_one_user
    #　adminユーザーが一人のみ、かつ削除しているuserがadminユーザーの場合削除できない
    if User.where("admin = true").count == 1 && self.admin?
      throw(:abort)
    end
  end
end
