class AddImageToAttachment < ActiveRecord::Migration[5.1]
  def up
    add_attachment :attachments, :image
  end

  def down
    remove_attachment :attachments, :image
  end
end
