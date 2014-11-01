class AddAttachmentAttachmentToPhotos < ActiveRecord::Migration
  def self.up
    change_table :photos do |t|
      t.attachment :attachment
    end
  end

  def self.down
    remove_attachment :photos, :attachment
  end
end
