class CreatePosts < ActiveRecord::Migration[5.0]
  
  belongs_to :users
  has_many :comments
  
  words = ["fuck", "shit", "bitch"]
  
  before_save{ 
    words.each do |word| 
      len = word.length
      self.content.gsub!(/#{word}/, '*'*len) if(self.content.include?(word))
    end
  }

  
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content

      t.timestamps
    end
  end
end
