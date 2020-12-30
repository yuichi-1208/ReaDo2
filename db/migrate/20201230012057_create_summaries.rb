class CreateSummaries < ActiveRecord::Migration[6.0]
  def change
    create_table :summaries do |t|

      t.timestamps
    end
  end
end
