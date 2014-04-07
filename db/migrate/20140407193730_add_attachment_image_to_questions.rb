class AddAttachmentImageToQuestions < ActiveRecord::Migration
  def self.up
    change_table :questions do |t|
      t.attachment :image
    end
  end

  def self.down
    drop_attached_file :questions, :image
  end
end
