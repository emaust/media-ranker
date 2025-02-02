class AddRelationshipsToVoteModel < ActiveRecord::Migration[5.2]
  def change
    def change
      remove_column(:votes, :user_id)
      remove_column(:votes, :work_id)
      add_reference(:votes, :user, foreign_key: true)
      add_reference(:votes, :work, foreign_key: true)
    end
  end
end
