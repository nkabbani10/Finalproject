class CreateInvestors < ActiveRecord::Migration[6.0]
  def change
    create_table :investors do |t|
      t.string :name
      t.string :dob
      t.string :bio
      t.string :image

      t.timestamps
    end
  end
end
