class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :organizer_name, :organizer_email, :title
      t.string :human_date
      t.date :date
    end
  end
end
