class CreateCoffees < ActiveRecord::Migration[5.2]
  def change
    create_table :coffees do |c|
      c.string :name 
      c.string :roaster 
      c.string :roast_level
      c.string :tasting_notes
      c.integer :rating 
      c.integer :user_id 
    end 
  end
end
