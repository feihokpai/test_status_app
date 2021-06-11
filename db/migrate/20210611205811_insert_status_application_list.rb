class InsertStatusApplicationList < ActiveRecord::Migration[6.1]
  def change
    down = StatusApplicationModel.new( id: 99, description: "DOWN" )
    down.save
    up = StatusApplicationModel.new( id: 100, description: "UP" )
    up.save
  end
end
