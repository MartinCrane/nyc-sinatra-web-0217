class CreateFigures < ActiveRecord::Migration
  def change
    create_table :figures do |d|
      d.string :name
    end
  end
end
