class RenameTitleQuestions < ActiveRecord::Migration[5.2]
  def change
    rename_column :questions, :titile, :title
  end
end
