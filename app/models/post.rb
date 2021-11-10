class Post < ApplicationRecord
  belongs_to :user
  has_many :photos, dependent: :destroy
  #dependent: :destroyをつけることで、オブジェクトが削除されるときに、関連付けられたオブジェクトのdestroyメソッドが実行
  #orderメソッドは関連付けられたオブジェクトに与えられる順序を指定(新しいいいね順)
  has_many :likes, -> { order(created_at: :desc) }, dependent: :destroy
  #親子関係のある関連モデル(今回でいうとPostモデルとPhotoモデル）で、親から子を作成したり保存するときに使える
  accepts_nested_attributes_for :photos

  def liked_by(user)
    #user_idとpost_idが一致するlikeを検索する
    Like.find_by(user_id: user.id, post_id: id)
  end
end
