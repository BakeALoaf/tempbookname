class AddUserToTransportations < ActiveRecord::Migration[7.0]
  def change
    add_reference :transportations, :user, null: false, foreign_key: true
  end
end
