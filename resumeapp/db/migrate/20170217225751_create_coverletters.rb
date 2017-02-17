class CreateCoverletters < ActiveRecord::Migration[5.0]
  def change
    create_table :coverletters do |t|
      t.integer :resume_id
      t.string :name

      t.timestamps
    end
  end
end
