class CreateInvestorprojects < ActiveRecord::Migration[6.0]
  def change
    create_table :investorprojects do |t|
      t.integer :investor_id
      t.integer :project_id

      t.timestamps
    end
  end
end
