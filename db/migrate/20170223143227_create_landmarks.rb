class CreateLandmarks < ActiveRecord::Migration
  def change
    create_table :landmarks do |d|
      d.string :name
      d.integer :figure_id
      d.integer :year_completed
    end
  end
end
