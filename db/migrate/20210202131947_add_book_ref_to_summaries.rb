class AddBookRefToSummaries < ActiveRecord::Migration[6.0]
  def change
    add_reference :summaries, :book, foreign_key: true
  end
end
