class ChangeHourToTimeInnHours < ActiveRecord::Migration
  def change
    rename_column :hours, :start_hour, :start_time
    rename_column :hours, :end_hour, :end_time
  end
end
