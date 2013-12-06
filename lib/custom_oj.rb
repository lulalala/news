# Oj wrapper for working with serialized column.
# Any blank inputs will be converted to nil,
# and vice versa.
class CustomOj
  def self.load(i)
    if i.blank?
      nil
    else
      Oj.load(i)
    end
  end

  def self.dump(i)
    if i.blank?
      nil
    else
      Oj.dump(i)
    end
  end
end
