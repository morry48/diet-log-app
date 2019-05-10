class Log < ApplicationRecord
  validates :name, presence: true
  validates :protein, presence: true
  validates :carbohydrate, presence: true
  validates :fat, presence: true
  validates :start_time, presence: true
  belongs_to :user

  def self.sumkcal 
    return (sumprotein * 4 + sumcarbohydrate * 4 + sumfat * 9) 
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

  def self.match_day
    return where('start_time LIKE(?)', "#{Time.now.strftime('%Y-%m-%d')}%")
  end

  def self.match_month
    return  where('start_time LIKE(?)', "#{Time.now.strftime('%Y-%m')}%")
  end
  



end





