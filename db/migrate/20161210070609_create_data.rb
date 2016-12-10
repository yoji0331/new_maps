class CreateData < ActiveRecord::Migration
  def change
    create_table :data do |t|
    	t.integer :survey_id
      t.string :site_name
      t.string :reseacher_name
      t.datetime :date
      t.string :weather
      t.float :temperature
      t.float :latitude
      t.float :longitude
      t.float :value1
      t.float :value2
      t.float :value3
      t.float :value4
      t.float :value5
      t.float :value6
      t.float :value7
      t.float :value8
      t.float :value9
      t.float :value10
      t.float :value11
      t.float :value12
      t.float :value13
      t.float :value14
      t.float :value15
      t.float :value16
      t.float :value17
      t.float :value18
      t.float :value19
      t.float :value20
      t.float :value21
      t.float :value22
      t.float :value23
      t.float :value24
      t.float :value25

      t.timestamps null: false
    end
  end
end
