class ChangeProblemAndExplanationToTextInPosts < ActiveRecord::Migration[6.1]
  def change
    change_column :posts, :problem, :text
    change_column :posts, :explanation, :text
  end
end
