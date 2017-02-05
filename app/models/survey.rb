class Survey < ActiveRecord::Base
    has_many :data, dependent: :destroy
    belongs_to :user
    
    #nameの文字数は256文字までである制限
    validates :name, presence: true, length: { maximum: 256 }
    attr_accessor :file
end
