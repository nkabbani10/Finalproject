class CreateFounderprojects < ActiveRecord::Migration[6.0]
  def change
    create_table :founderprojects do |t|
      t.integer :project_id
      t.integer :founder_id

      t.timestamps
    end
  end
end
