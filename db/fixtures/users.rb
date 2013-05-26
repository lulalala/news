seeds_hash = []
for i in 1..100 do
  seeds_hash << {id:i, email:"#{i}@1dv.tw"}
end
User.seed(:id, seeds_hash)
