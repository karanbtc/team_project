class CreateShifts < ActiveRecord::Migration[5.0]
  def change
    create_table :shifts do |t|
      t.references :team, foreign_key: true
      t.references :user, foreign_key: true
      t.jsonb :timing, default: {mon: '', tue: '', wed: '', thu: '', fri: '', sat: '', sun: ''}

      t.timestamps
    end
  end
end
