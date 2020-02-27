class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
    :recoverable, :rememberable, :trackable, :validatable

  before_validation :default_value

  STATES = [:resigned, :employed]
  GENDERS = [:male, :female]

  enum state: STATES
  enum gender: GENDERS

  has_many :profiles, as: :profileable

  validates_presence_of :state, :uuid, :access_token, :onboarded_at, :name #, :title, :gender
  validates :state, inclusion: { in: self.states.to_a.flatten }
  validates :gender, inclusion: { in: self.genders.to_a.flatten }

  def default_value
    self.state = 'resigned'
    self.uuid = SecureRandom.hex(8)
    self.access_token = SecureRandom.hex(8)
    self.onboarded_at = DateTime.current
    self.gender = 'female'
  end
end

