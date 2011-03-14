#MyPlace, by Arnaud Delcasse
# This project is licenced under the terms of the MIT Licence. See
# MIT-LICENCE.txt for more details

class Event
  include Mongoid::Document
  field :title, :type => String
  field :start, :type => Time
  field :end, :type => Time
  field :description, :type => String
end
