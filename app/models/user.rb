class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 30 }
  validates :email, presence: true, length: { maximum: 255 }, uniqueness: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  before_validation { email.downcase! }
  has_secure_password
  validates :password, length: { minimum: 6 }
  attribute :admin, :boolean, default: false
  has_many :tasks, dependent: :destroy
  has_many :labels, dependent: :destroy

  def admin?
    admin
  end
  before_update :check_admin_exist_for_update
  before_destroy :check_admin_exist_for_destroy

  private
    def check_admin_exist_for_update
      if self.is_only_one_admin? && self.will_save_change_to_attribute?(:admin)
        errors.add(:base, "Cannot change permissions as there will be zero administrators")
        throw(:abort)
      end 
    end

    def check_admin_exist_for_destroy
      throw(:abort) if self.is_only_one_admin?
    end

    def is_only_one_admin?
      User.where(admin: true).count == 1 && self == User.find_by(admin: true)
    end
end


