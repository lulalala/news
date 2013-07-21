tags = %w{虛構 邏輯錯誤 翻譯錯誤 斷章取義 廣告}
tags.each do |tag|
  ActsAsTaggableOn::Tag.find_or_create_by_name(tag)
end
