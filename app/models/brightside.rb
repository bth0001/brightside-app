class Brightside < ActiveRecord::Base
  validates :title, presence: true
  belongs_to :user
  before_save :default_values

  private

  def default_values
    self.completed ||= false
    nil                           # required so that TX will not rollback!!!
  end
end
