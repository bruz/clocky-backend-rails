# needed to change this to prevent namespace conflict in SproutCore
class RenameProjectStatus < ActiveRecord::Migration
  def self.up
    rename_column :projects, :status, :project_status
  end

  def self.down
    rename_column :projects, :project_status, :status
  end
end
