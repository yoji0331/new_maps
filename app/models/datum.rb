require 'csv'

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


  def self.import(survey)
    CSV.foreach(survey.file.path, {
      encoding: "cp932:utf-8", headers: true, skip_blanks: true }) do |row|
      survey.data.create!(
        site_name: row["調査地点名"],
        researcher_name: row["調査代表者名"],
        date: row["日付"],
        weather: row["天気"],
        temperature: row["気温"].to_f,
        latitude: row["緯度"].to_f,
        longitude: row["経度"].to_f,
        value1: row["流れる水の量"].to_f,
        value2: row["岸のようす"].to_f,
        value3: row["魚が川を遡れるか"].to_f,
        value4: row["川原と水辺の植物"].to_f,
        value5: row["鳥の生息、すみ場"].to_f,
        value6: row["魚の生息、すみ場"].to_f,
        value7: row["川底の様子と底生生物"].to_f,
        value8: row["透視度"].to_f,
        value9: row["水のにおい"].to_f,
        value10: row["COD"].to_f,
        value11: row["けしき(感じる)"].to_f,
        value12: row["ごみ(見る)"].to_f,
        value13: row["水との触れ合い"].to_f,
        value14: row["川のかおり(かぐ)"].to_f,
        value15: row["川の音(聞く)"].to_f,
        value16: row["歴史と文化"].to_f,
        value17: row["水辺の近づきやすさ"].to_f,
        value18: row["日常的な利用"].to_f,
        value19: row["産業などの活動"].to_f,
        value20: row["環境の活動"].to_f,
        value21: row["自然なすがた"].to_f,
        value22: row["豊かな生き物"].to_f,
        value23: row["水のきれいさ"].to_f,
        value24: row["快適な水辺"].to_f,
        value25: row["地域とのつながり"].to_f)
        
      end
  end  
end
