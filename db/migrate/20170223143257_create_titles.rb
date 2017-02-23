class CreateTitles < ActiveRecord::Migration
  def change
    create_table :titles do |d|
      d.string :name
    end
  end
end
