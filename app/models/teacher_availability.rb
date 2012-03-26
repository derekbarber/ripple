class TeacherAvailability < ActiveRecord::Base
 belongs_to :teacher

 validates :day_of_week, presence: true
end
