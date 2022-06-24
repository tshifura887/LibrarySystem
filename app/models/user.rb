class User < ApplicationRecord
  has_many :checkouts, foreign_key: :patron_id
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  def librarian?
    role == 'User::Librarian'
  end

  def patron?
    role == 'User::Patron'
  end
end
