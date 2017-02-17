class FixProblems < ActiveRecord::Migration[5.0]
  def up
    add_column :jobs, :resume_id, :integer
  end
end
