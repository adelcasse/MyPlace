#MyPlace, by Arnaud Delcasse
# This project is licenced under the terms of the MIT Licence. See
# MIT-LICENCE.txt for more details

class User
  include Mongoid::Document
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

end
