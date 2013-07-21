users_hash = []
(1..99).each do |i|
  users_hash << {id:i,email:"#{i}@example.com"}
end
User.seed_once(:id, users_hash)
