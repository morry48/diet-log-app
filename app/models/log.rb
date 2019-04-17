class Log < ApplicationRecord
  def self.sumkcal 
    sum(:protein)*4 + sum(:carbohydrate)*4 + sum(:fat)*9 
  end

  def self.sumprotein
    sum(:protein) 
  end
  def self.sumcarbohydrate
    sum(:carbohydrate) 
  end
  def self.sumfat
    sum(:fat) 
  end
end

def is_this_month(from_time)
  return (from_time.gsub(/(.{3})$/, '') == Date.today.strftime('%Y-%m'))
end


