namespace :my_task do
  desc "TODO"
  task test1: :environment do
    puts rand(20..29).sample(20)
  end

  desc "TODO"
  task test2: :environment do
    puts rand(30..39).sample(10)
  end

  desc "TODO"
  task test3: :environment do
    puts rand(40..49).sample(5)
  end

  desc "TODO"
  task test4: :environment do
    puts rand(50..59).sample(5)
  end

  def twenty_group
    My_task.create test1
    User.create name
    User.create phone
  end
  
  def thirty_group
    My_task.create test2
    User.create name
    User.create phone
  end
  
  def forty_group
    My_task.create test3
    User.create name
    User.create phone
    Comment.create comments
  end
  
  def fifty_group
    My_task.create test4
    User.create name
    User.create phone
    Post.create posts
  end
  
end
