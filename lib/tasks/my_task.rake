namespace :my_task do
  task test1: :environment do
    
    (1..20).each do |u|
      User.create name: Faker::Name.name, phone: Faker::Phone.cell_phone, age: rand(20..29)
    end
    
    (1..10).each do |u|
      User.create name: Faker::Name.name, phone: Faker::Phone.cell_phone, age: rand(30..39)
    end
    
    (1..5).each do |u|
      User.create name: Faker::Name.name, phone: Faker::Phone.cell_phone, age: rand(40..49)
      comment_40
    end
    
    (1..5).each do |u|
      User.create name: Faker::Name.name, phone: Faker::Phone.cell_phone, age: rand(50..59)
      posting_50
    end
  end
  
  def posting_50
    user_id_pick = User.where(age: 50..59)
    for i in 1..5
      Post.create title: Faker::Types.string, content: Faker::OnePiece.quote,
      user_id: user_id_pick[i]
    end
  end
  
  def comment_40
    user_id_pick = User.where(age: 40..49)
    post_index = Post.pluck(:post_id)
    for i in 1..5
      Comment.create content: Faker::OnePiece.quote, user_id: user_id_pick[i],
                     post_id: post_index[0]
      
      Comment.create content: Faker::OnePiece.quote, user_id: user_id_pick[i],
                     post_id: post_index[0]
    end
  end

end