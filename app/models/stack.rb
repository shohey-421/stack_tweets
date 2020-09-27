class Stack < ApplicationRecord
  belongs_to :user

  validates :task, presence:true, length: { maximum: 15 }
  validates :unit, presence:true, length: { maximum: 5 }
  validates :count, numericality: {only_integer: true}
end
