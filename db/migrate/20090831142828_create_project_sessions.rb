class CreateProjectSessions < ActiveRecord::Migration
  def self.up
    create_table :project_sessions do |t|
      t.integer :project_id
      t.datetime :start_time
      t.datetime :end_time
      t.string :description

      t.timestamps
    end
  end

  def self.down
    drop_table :project_sessions
  end
end
