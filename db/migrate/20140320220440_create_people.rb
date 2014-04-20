class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :name
      t.text   :message, :limit => 1000

      t.timestamps
    end
  end
end
