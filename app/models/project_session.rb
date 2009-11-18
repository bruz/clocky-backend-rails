class ProjectSession < ActiveRecord::Base
  belongs_to :project

  named_scope :finished, :conditions => "end_time IS NOT NULL"
  named_scope :running, :conditions => "start_time IS NOT NULL AND end_time IS NULL"

  def before_create
    self.start_time ||= DateTime.now
  end
end
