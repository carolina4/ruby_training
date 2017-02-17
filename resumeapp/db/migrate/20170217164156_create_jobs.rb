class CreateJobs < ActiveRecord::Migration[5.0]
  def change
    create_table :jobs do |t|
      t.string :company_name
      t.string :string
      t.text :work_summary
      t.datetime :start_date
      t.datetime :end_date

      t.timestamps
    end
  end
end
