class AddVoteTallyToMovie < ActiveRecord::Migration
  def change
    add_column :movies, :vote_tally, :integer, :default => 0
  end
end
