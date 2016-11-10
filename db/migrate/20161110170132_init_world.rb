class InitWorld < ActiveRecord::Migration # [5.0]
  def change
    create_table :quotes do |t|
      t.string      :value
      t.string      :author
      t.integer     :votes, default: 0

      t.timestamps null: false
    end
  end
end
