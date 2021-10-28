class RenameProofilePhotoColumnToUsers < ActiveRecord::Migration[6.0]
  def change
    rename_column :users, :proofile_photo, :profile_photo
  end
end
