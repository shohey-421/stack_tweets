class Stack < ApplicationRecord
  belongs_to :user

  validates :task, presence:true
  validates :task, numericality: {only_integer: true}
end
