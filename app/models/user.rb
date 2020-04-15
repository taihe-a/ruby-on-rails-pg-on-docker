class User < ApplicationRecord
  before_destroy :last_admin_user!
  has_secure_password
  has_many :tasks, dependent: :destroy

  private

  MIN_ADMIN_USER = 1
  scope :admin_user, -> { where('admin = true').count <= MIN_ADMIN_USER }

  def last_admin_user!
    # 　adminユーザーが一人のみ、かつ削除しているuserがadminユーザーの場合削除できない
    throw(:abort) if User.admin_user && admin?
  end
end
