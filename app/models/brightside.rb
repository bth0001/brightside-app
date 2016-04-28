class Brightside < ActiveRecord::Base
  validates :title, presence: true
  before_save :default_values
  belongs_to :user
  has_many :shines, dependent: :destroy
end

  def default_values
    #self.completed ||= false
    #nil                           # required so that TX will not rollback!!!
  end

