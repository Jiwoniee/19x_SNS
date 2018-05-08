class CreateComments < ActiveRecord::Migration[5.0]
  
  belongs_to :posts
  
  validates :content, length: {maximum: 100}
  
  def change
    create_table :comments do |t|
      t.text :content
      t.references :post, foreign_key: true

      t.timestamps
    end
  end
end