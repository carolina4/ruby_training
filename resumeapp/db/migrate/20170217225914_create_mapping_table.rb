class CreateMappingTable < ActiveRecord::Migration[5.0]
  def up
    create_table :employers_resumes, id: false do |t|
        t.integer :employer_id
        t.integer :resume_id
    end
  end
end
