class Membership < ApplicationRecord
  belongs_to :group, dependent: :destroy
  belongs_to :user
end
