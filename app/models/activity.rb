class Activity < ApplicationRecord

  validates :name, presence: true, length: {minimum: 1}

    #validates :name, :date, :time

    #Adds activity to database
    def add_activity (act)
    @activity = act
    end

    #Gets activity from database
    def get_activity
    @activity
    end

    #Determine if activity is in database
    # def is_present? (act)
    #find activity in database
    # end

    #Replace current activity with new activity
    #def edit_activity(curr_act, new_act)
    #find @activity in database
    #replace activity with new
    #end

    #Remove activity from database
    #def delete_activity(act)
    #delete
    #end

end
