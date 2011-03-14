#MyPlace, by Arnaud Delcasse
# This project is licenced under the terms of the MIT Licence. See
# MIT-LICENCE.txt for more details

class CalendarEvent
  include Mongoid::Document
  field :title, :type => String
  field :allDay, :type => Boolean
  #field :start_date, :type => String
  #field :end_date, :type => String
  #field :start_time, :type => String
  #field :end_time, :type => String
  field :owner
  field :start, type => String
  field :end, type => String
  field :description, :type => String
  
  attr_accessor :start_date, :end_date, :start_time, :end_time

  #def start
  #  start_date+' '+start_time.to_s
  #end

  #def end
  #  end_date+' '+end_time.to_s
  #end
end
