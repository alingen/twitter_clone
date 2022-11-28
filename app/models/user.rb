class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :name, presence: true, length: { maximum: 50 }

  def active_for_authentication?
    super && (is_deleted == false)
  end

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
