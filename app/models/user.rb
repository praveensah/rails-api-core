class User < ActiveRecord::Base
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable,
          :confirmable, :omniauthable

  def send_devise_notification(notification, *args)
    devise_mailer.send(notification, self, *args).deliver_later
  end

  include DeviseTokenAuth::Concerns::User

  include ApplicationHelper

  has_many :user_roles
  has_many :roles, :through => :user_roles

  before_create do |user|
    self.referral_code = self.email.split("@").first.downcase + rand(1000..9999).to_s
    self.referred_by = self.referred_by.downcase if self.referred_by.present?
  end

  after_create do |user|
    referrer = self.my_referrer
  end

  def is?( requested_role )
    self.role == requested_role.to_s
  end

  def my_referrer
    User.find_by_referral_code(self.referred_by) if self.referred_by.present?
  end

  def add_role(role, params)
    self.roles << Role.find_by_name(role)
    eval "create_#{role}(params)"
  rescue Exception => e
    rescue_exception(e)
  end
end