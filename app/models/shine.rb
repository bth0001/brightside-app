class Shine < ActiveRecord::Base
  validates :title, presence: true
  before_save :default_values
  belongs_to :brightside

  def default_values
    #self.completed ||= false
    #nil                           # required so that TX will not rollback!!!
  end

end
