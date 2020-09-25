class Stack < ApplicationRecord
  belongs_to :user

  validates :task, presence:true
  validates :count, numericality: {only_integer: true}
end