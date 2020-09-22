class CreateSurgeries < ActiveRecord::Migration[5.2]
  def change
    create_table :surgeries do |t|
      t.string :title
      t.string :week_day
      t.string :operating_room
    end
  end
end
