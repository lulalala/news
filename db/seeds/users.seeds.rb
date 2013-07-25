users_hash = []
(1..99).each do |i|
  users_hash << {id:i,email:"#{i}@example.com"}
end

# Guest user
users_hash << {id:100,email:"guest@example.com",guest:true}

User.seed_once(:id, users_hash)
