class CreateRequests < ActiveRecord::Migration[7.0]
  def change
    create_table :requests do |t|
      t.integer :number_requested
      t.integer :number_accepted
      t.integer :number_rejected

      t.timestamps
    end
  end
end
