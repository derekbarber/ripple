class TeacherAvailability < ActiveRecord::Base
 belongs_to :teacher

 validates :day_of_week, presence: true
 validates :start_time, presence: true
 validates :end_time, presence: true

 validate :start_time_before_end_time

 def start_time_before_end_time
   if self.start_time >= self.end_time
     self.errors.add :base, "The start time must be less than the end time"
   end
 end
end
