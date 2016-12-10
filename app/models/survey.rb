class Survey < ActiveRecord::Base
    has_many :data
    belongs_to :user
    
    #nameの文字数は256文字までである制限
    validates :name, presence: true, length: { maximum: 256 }  
end
