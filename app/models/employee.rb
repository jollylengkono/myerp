class Employee < ApplicationRecord

  before_save   {self.email_address = email_address.downcase }
  validates     :first_name, presence: true, length: {maximum: 14}
  validates     :last_name, presence: true, length: {maximum: 14}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates     :email_address, presence: true, length: {maximum: 50}, format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}
  validates     :password, presence: true, length: {minumum: 6, maximum: 14}, allow_nil: true
  validates     :phone_number, numericality: {only_integer: true}
  validates     :department_id, presence: true
  validates     :branch_id, presence: true
  has_secure_password

end
