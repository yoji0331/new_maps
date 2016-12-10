class Datum < ActiveRecord::Base
	belongs_to :survey
  #dateは日付である制限(2016-10-30 15:32:40)
  validates :date, presence: true
  #datetime型の制限がわからない(setupの時点で止まっている)
  
  #緯度経度は数値である制限(緯度-90~90の間である)(-180~180)
  validates :latitude, presence: true,
  numericality: {greater_than_or_equal_to: -90 ,less_than_or_equal_to: 90}
  #validates :latitude, presence: true,  inclusion: {numericality: true, in: -90..90 }
  validates :longitude, presence: true, 
  numericality: {greater_than_or_equal_to: -180 ,less_than_or_equal_to: 180}
  
  #天気は256文字までである
  validates :weather, length: { maximum: 256 }

  #気温は数字で-100~100度である
  validates :temperature,
  numericality: {greater_than_or_equal_to: -100 ,less_than_or_equal_to: 100}
  
  #データの項目は数値である制限(範囲は0~3)
  validates :value1,
  numericality: {greater_than_or_equal_to: 0 ,less_than_or_equal_to: 3}
  validates :value2,
  numericality: {greater_than_or_equal_to: 0 ,less_than_or_equal_to: 3}
  validates :value3,
  numericality: {greater_than_or_equal_to: 0 ,less_than_or_equal_to: 3}
  validates :value4,
  numericality: {greater_than_or_equal_to: 0 ,less_than_or_equal_to: 3}
  validates :value5,
  numericality: {greater_than_or_equal_to: 0 ,less_than_or_equal_to: 3}
  validates :value6,
  numericality: {greater_than_or_equal_to: 0 ,less_than_or_equal_to: 3}
  validates :value7,
  numericality: {greater_than_or_equal_to: 0 ,less_than_or_equal_to: 3}
  validates :value8,
  numericality: {greater_than_or_equal_to: 0 ,less_than_or_equal_to: 3}
  validates :value9,
  numericality: {greater_than_or_equal_to: 0 ,less_than_or_equal_to: 3}
  validates :value10,
  numericality: {greater_than_or_equal_to: 0 ,less_than_or_equal_to: 3}
  validates :value11,
  numericality: {greater_than_or_equal_to: 0 ,less_than_or_equal_to: 3}
  validates :value12,
  numericality: {greater_than_or_equal_to: 0 ,less_than_or_equal_to: 3}
  validates :value13,
  numericality: {greater_than_or_equal_to: 0 ,less_than_or_equal_to: 3}
  validates :value14,
  numericality: {greater_than_or_equal_to: 0 ,less_than_or_equal_to: 3}
  validates :value15,
  numericality: {greater_than_or_equal_to: 0 ,less_than_or_equal_to: 3}
  validates :value16,
  numericality: {greater_than_or_equal_to: 0 ,less_than_or_equal_to: 3}
  validates :value17,
  numericality: {greater_than_or_equal_to: 0 ,less_than_or_equal_to: 3}
  validates :value18,
  numericality: {greater_than_or_equal_to: 0 ,less_than_or_equal_to: 3}
  validates :value19,
  numericality: {greater_than_or_equal_to: 0 ,less_than_or_equal_to: 3}
  validates :value20,
  numericality: {greater_than_or_equal_to: 0 ,less_than_or_equal_to: 3}
  validates :value21,
  numericality: {greater_than_or_equal_to: 0 ,less_than_or_equal_to: 3}
  validates :value22,
  numericality: {greater_than_or_equal_to: 0 ,less_than_or_equal_to: 3}
  validates :value23,
  numericality: {greater_than_or_equal_to: 0 ,less_than_or_equal_to: 3}
  validates :value24,
  numericality: {greater_than_or_equal_to: 0 ,less_than_or_equal_to: 3}
  validates :value25,
  numericality: {greater_than_or_equal_to: 0 ,less_than_or_equal_to: 3}
  
end
