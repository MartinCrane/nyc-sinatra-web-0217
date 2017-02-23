class CreateTitleFigures < ActiveRecord::Migration
  def change
    create_table :title_figures do |d|
      d.integer :title_id
      d.integer :figure_id
    end
  end
end
