class Quote < ActiveRecord::Base
  validates :value, presence: true
  validates :author, presence: true
end
