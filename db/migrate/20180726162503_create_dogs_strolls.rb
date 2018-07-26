class CreateDogsStrolls < ActiveRecord::Migration[5.2]
  def change
    create_table :dogs_strolls do |t|
      t.belongs_to :dog
      t.belongs_to :stroll
    end
  end
end
