class CreateEmployees < ActiveRecord::Migration[5.0]
  def change
    create_table :departments do |t|
      t.string  :department_code, limit: 4
      t.string  :department_name, limit: 20
      t.string  :description, limit: 200
      t.timestamps
    end

    create_table :branches do |t|
      t.string  :branch_code, limit: 5
      t.string  :address, limit: 150
      t.string  :city, limit: 50
      t.string  :phone_number, limit: 20
      t.timestamps
    end

    create_table :employees do |t|
      t.string  :user_name, limit: 20
      t.string  :password, limit: 14
      t.string  :first_name, limit: 14
      t.string  :last_name, limit: 14
      t.string  :phone_number, limit: 20
      t.string  :email_address, limit: 50
      t.belongs_to  :department, foreign_key: true
      t.belongs_to  :branch, foreign_key: true
      t.timestamps
    end
  end
end
